# This is just an example, you should generate yours with nixos-generate-config and put it in here.
# Este é apenas um exemplo, você deve gerar o seu com nixos-generate-config e colocá-lo aqui.
# COMO GERAR???
# MUDAR ISSO AQUI, TIRAR O TREM NA NIVIDIA E VER COMO GERAR O NIXOS-GENERATE-CONFIG!!!

{ 
	config,
	lib,
	pkgs,
	modulesPath,
	... 
}: 

{
	imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [ ];
	boot.kernelModules = [ "kvm-intel" ];
	boot.extraModulePackages = [ ];

	fileSystems."/" = {
		device = "/dev/disk/by-uuid/cfb9265b-50f0-446b-aa37-2740c40f33ba";
		fsType = "ext4";
	};

	fileSystems."/boot" = {
		device = "/dev/disk/by-uuid/E7C5-5C30";
		fsType = "vfat";
	};

	swapDevices = [ {
		device = "/dev/disk/by-uuid/7448942c-68a3-45ab-b257-c12521be58d7"; 
	}];

	# Load nvidia driver for Xorg and Wayland
	services.xserver.videoDrivers = ["nvidia"];

	hardware.nvidia = {
		# Modesetting is required.
		modesetting.enable = true;

		# Nvidia power management. Experimental, and can cause sleep/suspend to fail.
		# powerManagement.enable = false;
		# Fine-grained power management. Turns off GPU when not in use.
		# Experimental and only works on modern Nvidia GPUs (Turing or newer).
		# powerManagement.finegrained = false;

		# Use the NVidia open source kernel module (not to be confused with the
		# independent third-party "nouveau" open source driver).
		# Support is limited to the Turing and later architectures. Full list of 
		# supported GPUs is at: 
		# https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
		# Only available from driver 515.43.04+
		# Do not disable this unless your GPU is unsupported or if you have a good reason to.
		# open = true;

		# Enable the Nvidia settings menu,
		# accessible via `nvidia-settings`.
		nvidiaSettings = true;

		# Optionally, you may need to select the appropriate driver version for your specific GPU.
		package = config.boot.kernelPackages.nvidiaPackages.stable;

		prime = {
			# Make sure to use the correct Bus ID values for your system!
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};

	# Set your system kind (needed for flakes)

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}