{ config, lib, ... }:
{
  config = lib.mkIf (config.desktop == "hyprland") {
    programs.dank-material-shell.settings = {
  lockScreenWidgetInstances = [
    {
      config = {
        autoPosition = true;
        colorMode = "default";
        customColor = "#ffffff";
        displayPreferences = [
          "all"
        ];
        showAnalogNumbers = false;
        showAnalogSeconds = true;
        showDate = false;
        showDigitalSeconds = false;
        style = "expressive";
        syncPositionAcrossScreens = true;
        transparency = 0;
        twoTone = true;
        weight = 0;
      };
      enabled = false;
      id = "lock_clock";
      widgetType = "desktopClock";
    }
    {
      config = {
        colorMode = "default";
        customColor = "#ffffff";
        displayPreferences = [
          "all"
        ];
        format = "short";
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_date";
      widgetType = "lockDate";
    }
    {
      config = {
        displayPreferences = [
          "all"
        ];
        passwordVisibility = "typing";
        profileVisibility = "typing";
        style = "ring";
        syncPositionAcrossScreens = true;
      };
      enabled = true;
      id = "lock_auth";
      name = "Password";
      widgetType = "lockAuth";
    }
    {
      config = {
        displayPreferences = [
          "all"
        ];
        mode = 2;
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_notifications";
      widgetType = "lockNotifications";
    }
    {
      config = {
        background = false;
        displayPreferences = [
          "all"
        ];
        showMediaPlayer = true;
        showWeather = true;
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_status";
      widgetType = "lockStatus";
    }
    {
      config = {
        displayPreferences = [
          "all"
        ];
        shape = "round";
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_power";
      widgetType = "lockPower";
    }
  ];
  greeterWidgetInstances = [
    {
      config = {
        autoPosition = true;
        colorMode = "default";
        customColor = "#ffffff";
        displayPreferences = [
          "all"
        ];
        showAnalogNumbers = false;
        showAnalogSeconds = true;
        showDate = false;
        showDigitalSeconds = false;
        style = "expressive";
        syncPositionAcrossScreens = true;
        transparency = 0;
        twoTone = true;
        weight = 0;
      };
      enabled = false;
      id = "lock_clock";
      widgetType = "desktopClock";
    }
    {
      config = {
        colorMode = "default";
        customColor = "#ffffff";
        displayPreferences = [
          "all"
        ];
        format = "short";
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_date";
      widgetType = "lockDate";
    }
    {
      config = {
        displayPreferences = [
          "all"
        ];
        passwordVisibility = "typing";
        profileVisibility = "typing";
        style = "ring";
        syncPositionAcrossScreens = true;
      };
      enabled = true;
      id = "lock_auth";
      name = "Password";
      widgetType = "lockAuth";
    }
    {
      config = {
        background = false;
        displayPreferences = [
          "all"
        ];
        showMediaPlayer = true;
        showWeather = true;
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_status";
      widgetType = "lockStatus";
    }
    {
      config = {
        displayPreferences = [
          "all"
        ];
        shape = "round";
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_power";
      widgetType = "lockPower";
    }
    {
      config = {
        displayPreferences = [
          "all"
        ];
        syncPositionAcrossScreens = true;
      };
      enabled = true;
      id = "greeter_session";
      widgetType = "greeterSession";
    }
  ];
  displayNameMode = "system";
  currentThemeName = "custom";
  customThemeFile = "/home/kkroto/.config/dms/themes/catppuccin/theme.json";
  registryThemeVariants = {
    amoledBlack = {
      light = {
        accent = "orange";
        flavor = "black-light";
      };
    };
    amoledNoir = {
      dark = {
        accent = "orange";
        flavor = "noir";
      };
      light = {
        accent = "amber";
        flavor = "paper";
      };
    };
    bru = {
      dark = {
        accent = "orange";
        flavor = "espresso";
      };
      light = {
        accent = "orange";
        flavor = "latte";
      };
    };
    catppuccin = {
      dark = {
        accent = "peach";
        flavor = "mocha";
      };
      light = {
        accent = "peach";
        flavor = "latte";
      };
    };
  };
  radiusStrength = 85;
  clockFormat = "24h";
  showSeconds = false;
  padHours12Hour = false;
  useFahrenheit = false;
  animationDuration = 464;
  enableRippleEffects = true;
  popoutElevationEnabled = true;
  blurBorderEnabled = true;
  blurBorderColor = "outline";
  blurBorderCustomColor = "#ffffff";
  blurBorderOpacity = 0.57;
  wallpaperFillMode = "Fill";
  wallpaperBackgroundColorMode = "custom";
  wallpaperBackgroundCustomColor = "#000000";
  lockDateFormat = "";
  useAutoLocation = true;
  weatherEnabled = true;
  fontFamily = "Google Sans Flex";
  monoFontFamily = "Fira Code";
  displayFontFamily = "DM Serif Display";
  fontWeight = 400;
  fontScale = 1.1;
  textRenderType = 0;
  textRenderQuality = 0;
  lockScreenShowPowerActions = false;
  lockScreenShowProfileImage = true;
  lockScreenShowWeather = false;
  lockScreenWallpaperPath = "";
  lockScreenWallpaperFillMode = "";
  lockScreenFontFamily = "Notable";
  powerActionConfirm = true;
  powerActionHoldDuration = 0.5;
  powerMenuActions = [
    "reboot"
    "logout"
    "poweroff"
    "lock"
    "suspend"
    "restart"
  ];
  powerMenuDefaultAction = "logout";
  powerMenuGridLayout = true;
  dockConfigs = [
    {
      id = "dock";
      name = "Dock";
      enabled = false;
      screenPreferences = [
        "all"
      ];
      showOnLastDisplay = true;
      position = 1;
      mode = "compact";
      middleClickAction = "close";
      taskbarAlign = "center";
      widgetExpansion = "popout";
      iconSize = 41;
      spacing = 4;
      itemSpacing = 4;
      margin = 0;
      bottomGap = 0;
      transparency = 1;
      followInterfaceStyle = false;
      autoHide = false;
      smartAutoHide = false;
      useOverlayLayer = false;
      editOnRightClick = false;
      showOnFullscreen = false;
      openOnOverview = false;
      groupByApp = false;
      separatePinnedAndRunningApps = false;
      restoreSpecialWorkspaceOnClick = false;
      isolateDisplays = false;
      indicatorStyle = "circle";
      borderEnabled = false;
      borderColor = "surfaceText";
      borderOpacity = 1;
      borderThickness = 1;
      launcherEnabled = false;
      launcherLogoMode = "apps";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "";
      launcherLogoSizeOffset = 0;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      maxVisibleApps = 0;
      maxVisibleRunningApps = 0;
      showOverflowBadge = true;
      showTrash = false;
      trashFileManager = "default";
      trashCustomCommand = "";
      magnification = false;
      magnificationScale = 130;
      magnificationProfile = "parabolic";
      magnificationExpand = false;
      order = [
      
      ];
      widgets = [
        {
          enabled = true;
          id = "dock_launcher";
          widgetId = "dockLauncher";
        }
        {
          enabled = true;
          id = "dock_apps";
          widgetId = "appsDock";
        }
        {
          enabled = true;
          id = "dock_trash";
          widgetId = "dockTrash";
        }
      ];
    }
  ];
  currentThemeCategory = "registry";
  matugenScheme = "scheme-tonal-spot";
  matugenContrast = 0;
  matugenSpec = "2025";
  runUserMatugenTemplates = true;
  matugenTargetMonitor = "";
  generateThemeAtStartup = true;
  popupTransparency = 0.78;
  dmsWindowsFloatingSeeded = [
    "hyprland"
  ];
  cardSurfaceColor = "default";
  cardSurfaceCustomColor = "#6750A4";
  chipSurfaceColor = "default";
  chipSurfaceNestedColor = "default";
  widgetBackgroundColor = "secondaryContainer";
  widgetBackgroundCustomColor = "#6750A4";
  widgetBackgroundCustomStrength = 0.5;
  widgetColorMode = "default";
  controlCenterTileColorMode = "primary";
  buttonColorMode = "primary";
  niriLayoutGapsOverride = (-1);
  niriLayoutRadiusOverride = (-1);
  niriLayoutBorderSize = (-1);
  hyprlandLayoutGapsOverride = (-1);
  hyprlandLayoutGapsOutOverride = (-1);
  hyprlandLayoutRadiusOverride = (-1);
  hyprlandLayoutBorderSize = (-1);
  hyprlandResizeOnBorder = false;
  mangoLayoutGapsOverride = (-1);
  mangoLayoutGapsOutOverride = (-1);
  mangoLayoutRadiusOverride = (-1);
  mangoLayoutBorderSize = (-1);
  firstDayOfWeek = (-1);
  showWeekNumber = false;
  calendarBackend = "auto";
  windSpeedUnit = "kmh";
  syncComponentAnimationSpeeds = true;
  reduceMotion = false;
  springBounce = 1;
  motionEffect = 1;
  density = "dense";
  interfaceStyle = "classic";
  m3ElevationEnabled = true;
  m3ElevationIntensity = 12;
  m3ElevationOpacity = 30;
  m3ElevationColorMode = "primary";
  m3ElevationLightDirection = "top";
  m3ElevationCustomColor = "#000000";
  modalElevationEnabled = true;
  barElevationEnabled = false;
  blurEnabled = true;
  blurStrength = 104;
  blurBorderSeeded = true;
  blurForegroundLayers = true;
  foregroundLayerTransparency = 0.63;
  blurLayerOutlineOpacity = 0.12;
  blurredWallpaperLayer = false;
  blurWallpaperOnOverview = false;
  systemTrayIconTintMode = "monochrome";
  systemTrayIconTintSaturation = 50;
  systemTrayIconTintStrength = 135;
  controlCenterWidgets = [
    {
      enabled = true;
      h = 1;
      id = "user";
      w = 5;
    }
    {
      enabled = true;
      h = 1;
      id = "settings";
      small = true;
      w = 1;
    }
    {
      enabled = true;
      h = 1;
      id = "lock";
      small = true;
      w = 1;
    }
    {
      enabled = true;
      h = 1;
      id = "power";
      small = true;
      w = 1;
    }
    {
      enabled = true;
      h = 1;
      id = "volumeSlider";
      w = 4;
    }
    {
      deviceName = "ddc:i2c-4";
      enabled = true;
      h = 1;
      id = "brightnessSlider";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "wifi";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "bluetooth";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "audioOutput";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "audioInput";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "nightMode";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "darkMode";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "edit";
      small = true;
      w = 1;
    }
    {
      col = 0;
      enabled = true;
      h = 1;
      id = "runningApps";
      row = 6;
      small = true;
      w = 4;
    }
  ];
  workspaceNameIcons = {
  
  };
  scrollTitleEnabled = true;
  audioVisualizerEnabled = true;
  audioWheelScrollAmount = 5;
  bluetoothMprisEnabled = true;
  mediaExcludePlayers = [
  
  ];
  appIdSubstitutions = [
    {
      pattern = "Spotify";
      replacement = "spotify";
      type = "exact";
    }
    {
      pattern = "beepertexts";
      replacement = "beeper";
      type = "exact";
    }
    {
      pattern = "home assistant desktop";
      replacement = "homeassistant-desktop";
      type = "exact";
    }
    {
      pattern = "com.transmissionbt.transmission";
      replacement = "transmission-gtk";
      type = "contains";
    }
    {
      pattern = "^steam_app_(\\d+)$";
      replacement = "steam_icon_$1";
      type = "regex";
    }
  ];
  centeringMode = "index";
  clockDateFormat = "";
  browserPickerViewMode = "grid";
  appPickerViewMode = "grid";
  sortAppsAlphabetically = false;
  appLauncherGridColumns = 4;
  rememberLastQuery = false;
  rememberLastMode = true;
  spotlightSectionViewModes = {
  
  };
  appDrawerSectionViewModes = {
  
  };
  niriOverviewOverlayEnabled = true;
  niriOverviewLauncherStyle = "full";
  dankLauncherV2Size = "compact";
  dankLauncherV2ShowSourceBadges = true;
  dankLauncherV2BorderEnabled = false;
  dankLauncherV2BorderThickness = 2;
  dankLauncherV2BorderColor = "primary";
  dankLauncherV2ShowFooter = true;
  dankLauncherV2UnloadOnClose = false;
  dankLauncherV2IncludeFilesInAll = false;
  dankLauncherV2IncludeFoldersInAll = false;
  launcherUseOverlayLayer = false;
  launcherStyle = "full";
  spotlightBarShowModeChips = false;
  keybindsFloatingWindow = false;
  dashTabPosition = "auto";
  dashTabsEvenlySpaced = true;
  dashTabs = [
    {
      enabled = true;
      id = "overview";
    }
    {
      enabled = true;
      id = "media";
    }
    {
      enabled = true;
      id = "wallpaper";
    }
    {
      enabled = true;
      id = "weather";
    }
    {
      enabled = true;
      id = "settings";
    }
    {
      enabled = true;
      id = "wellbeing";
    }
    {
      enabled = false;
      id = "notifications";
    }
  ];
  dashOptions = {
    media = {
      albumArtAccent = false;
    };
  };
  networkPreference = "wifi";
  iconThemeDark = "Bibata-Original-Ice";
  iconThemeLight = "System Default";
  iconThemePerMode = false;
  cursorSettings = {
    dwl = {
      cursorHideTimeout = 0;
    };
    hyprland = {
      hideOnKeyPress = false;
      hideOnTouch = false;
      inactiveTimeout = 0;
    };
    niri = {
      hideAfterInactiveMs = 0;
      hideWhenTyping = false;
    };
    size = 31;
    theme = "Bibata-Modern-Classic";
  };
  notepadUseMonospace = true;
  notepadFontFamily = "";
  notepadFontSize = 14;
  notificationSummaryFontSize = 0;
  notificationBodyFontSize = 0;
  notepadShowLineNumbers = false;
  notepadAutoSave = false;
  notepadSlideoutSide = "right";
  notepadDefaultMode = "slideout";
  notepadTransparencyOverride = (-1);
  notepadLastCustomTransparency = 0.78;
  notepadUseCompositorGap = false;
  notepadEdgeGap = 0;
  soundsEnabled = true;
  useSystemSoundTheme = false;
  soundLogin = false;
  soundNewNotification = true;
  soundVolumeChanged = true;
  soundPluggedIn = true;
  muteSoundsWhenMediaPlaying = true;
  acMonitorTimeout = 1200;
  acLockTimeout = 3600;
  acSuspendTimeout = 5400;
  acSuspendBehavior = 0;
  acProfileName = "2";
  acPostLockMonitorTimeout = 0;
  batteryMonitorTimeout = 300;
  batteryLockTimeout = 300;
  batterySuspendTimeout = 900;
  batterySuspendBehavior = 0;
  batteryProfileName = "1";
  batteryPostLockMonitorTimeout = 0;
  batteryChargeLimit = 100;
  batteryNotifyChargeLimit = false;
  batteryCriticalThreshold = 10;
  batteryNotifyCritical = true;
  batteryLowThreshold = 20;
  batteryNotifyLow = false;
  batteryChargeLimitNotificationType = 0;
  batteryLowNotificationType = 0;
  batteryCriticalNotificationType = 1;
  batteryAutoPowerSaver = false;
  lockBeforeSuspend = true;
  loginctlLockIntegration = true;
  fadeToLockEnabled = true;
  fadeToLockGracePeriod = 30;
  fadeToDpmsEnabled = true;
  fadeToDpmsGracePeriod = 5;
  launchPrefix = "";
  syncModeWithPortal = true;
  terminalsAlwaysDark = false;
  muxType = "tmux";
  muxUseCustomCommand = false;
  muxCustomCommand = "";
  muxSessionFilter = "";
  runDmsMatugenTemplates = true;
  matugenTemplateGtk = true;
  matugenTemplateNiri = false;
  matugenTemplateHyprland = true;
  matugenTemplateMangowc = false;
  matugenTemplateQt5ct = false;
  matugenTemplateQt6ct = true;
  matugenTemplateFirefox = true;
  matugenTemplatePywalfox = true;
  matugenTemplateZenBrowser = true;
  matugenTemplateVesktop = true;
  matugenTemplateVencord = true;
  matugenTemplateEquibop = true;
  matugenTemplateGhostty = true;
  matugenTemplateKitty = true;
  matugenTemplateFoot = true;
  matugenTemplateAlacritty = true;
  matugenTemplateNeovim = true;
  matugenTemplateWezterm = true;
  matugenTemplateDgop = true;
  matugenTemplateKcolorscheme = true;
  matugenTemplateVscode = true;
  matugenTemplateEmacs = true;
  matugenTemplateZed = true;
  matugenTemplateNeovimSettings = {
    dark = {
      baseTheme = "github_dark";
      harmony = 0.5;
    };
    light = {
      baseTheme = "github_light";
      harmony = 0.5;
    };
  };
  matugenTemplateNeovimSetBackground = true;
  notificationOverlayEnabled = true;
  notificationPopupShadowEnabled = true;
  notificationPopupPrivacyMode = false;
  notificationForegroundLayers = true;
  modalDarkenBackground = false;
  lockScreenPowerOffMonitorsOnLock = false;
  lockAtStartup = false;
  enableFprint = false;
  maxFprintTries = 15;
  enableU2f = false;
  u2fMode = "or";
  lockPamPath = "";
  lockPamInlineFprint = false;
  lockPamInlineU2f = false;
  lockPamExternallyManaged = false;
  lockU2fPamPath = "";
  lockScreenInactiveColor = "#000000";
  lockScreenVideoEnabled = false;
  lockScreenVideoPath = "";
  lockScreenVideoCycling = false;
  notificationTimeoutLow = 5000;
  notificationTimeoutNormal = 5000;
  notificationTimeoutCritical = 0;
  notificationCompactMode = false;
  notificationShowTimeoutBar = false;
  notificationDedupeEnabled = true;
  notificationPopupPosition = 0;
  notificationHistoryEnabled = true;
  notificationHistoryMaxCount = 50;
  notificationHistoryMaxAgeDays = 7;
  notificationHistorySaveLow = true;
  notificationHistorySaveNormal = true;
  notificationHistorySaveCritical = true;
  notificationRules = [
  
  ];
  notificationFocusedMonitor = false;
  osdAlwaysShowValue = false;
  osdPosition = 5;
  osdVolumeEnabled = true;
  osdMediaVolumeEnabled = true;
  osdMediaPlaybackEnabled = false;
  osdBrightnessEnabled = true;
  osdIdleInhibitorEnabled = true;
  osdMicMuteEnabled = true;
  osdCapsLockEnabled = true;
  osdPowerProfileEnabled = false;
  osdAudioOutputEnabled = true;
  customPowerActionLock = "";
  customPowerActionLogout = "";
  customPowerActionSuspend = "";
  customPowerActionHibernate = "";
  customPowerActionReboot = "";
  customPowerActionPowerOff = "";
  updaterCheckOnStart = false;
  updaterUseCustomCommand = false;
  updaterCustomCommand = "";
  updaterTerminalAdditionalParams = "";
  updaterIntervalSeconds = 1800;
  updaterIncludeFlatpak = true;
  updaterAllowAUR = true;
  updaterIgnoredPackages = [
  
  ];
  screenPreferences = {
    wallpaper = [
      "all"
    ];
  };
  showOnLastDisplay = {
  
  };
  displayProfiles = {
  
  };
  displayProfileAutoSelect = false;
  displayShowDisconnected = false;
  displaySnapToEdge = true;
  connectedFrameBarStyleBackups = {
  
  };
  barConfigs = [
    {
      autoHide = false;
      autoHideDelay = 250;
      barInsetPadding = 4;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 2;
      bottomGap = 0;
      centerWidgets = [
        {
          audioScrollMode = "volume";
          enabled = true;
          id = "music";
          mediaAdaptiveWidthEnabled = true;
          mediaSize = 1;
        }
        {
          clockCompactMode = false;
          enabled = true;
          id = "clock";
        }
        {
          enabled = true;
          id = "weather";
        }
        {
          enabled = true;
          id = "bongoCat";
        }
      ];
      clickThrough = false;
      dot = false;
      enabled = true;
      followInterfaceStyle = false;
      fontScale = 1;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 63;
      gothCornersEnabled = true;
      hoverPopoutDelay = 53;
      hoverPopouts = false;
      iconScale = 1;
      id = "default";
      innerPadding = 0;
      leftWidgets = [
        {
          dwlShowAllTags = false;
          enabled = true;
          groupActiveWorkspaceApps = false;
          groupWorkspaceApps = true;
          id = "workspaceSwitcher";
          maxWorkspaceIcons = 3;
          reverseScrolling = false;
          showOccupiedWorkspacesOnly = true;
          showWorkspaceApps = false;
          showWorkspaceIndex = true;
          showWorkspaceName = false;
          showWorkspacePadding = true;
          workspaceActiveAppHighlightEnabled = false;
          workspaceAppIconSizeOffset = 0;
          workspaceColorMode = "default";
          workspaceDragReorder = true;
          workspaceFocusedBorderColor = "primary";
          workspaceFocusedBorderCustomColor = "#6750A4";
          workspaceFocusedBorderEnabled = true;
          workspaceFocusedBorderThickness = 2;
          workspaceFocusedCustomColor = "#6750A4";
          workspaceFollowFocus = true;
          workspaceOccupiedColorMode = "none";
          workspaceOccupiedCustomColor = "#625B71";
          workspaceUnfocusedColorMode = "default";
          workspaceUnfocusedCustomColor = "#49454E";
          workspaceUnfocusedMonitorBorderColor = "primary";
          workspaceUnfocusedMonitorBorderCustomColor = "#6750A4";
          workspaceUnfocusedMonitorBorderEnabled = false;
          workspaceUnfocusedMonitorBorderThickness = 2;
          workspaceUnfocusedMonitorColorMode = "default";
          workspaceUnfocusedMonitorFocusedCustomColor = "#6750A4";
          workspaceUnfocusedMonitorOccupiedColorMode = "none";
          workspaceUnfocusedMonitorOccupiedCustomColor = "#625B71";
          workspaceUnfocusedMonitorSeparateAppearance = false;
          workspaceUnfocusedMonitorUnfocusedColorMode = "default";
          workspaceUnfocusedMonitorUnfocusedCustomColor = "#49454E";
          workspaceUnfocusedMonitorUrgentColorMode = "default";
          workspaceUnfocusedMonitorUrgentCustomColor = "#B3261E";
          workspaceUrgentColorMode = "default";
          workspaceUrgentCustomColor = "#B3261E";
        }
        {
          enabled = true;
          focusedWindowCompactMode = true;
          focusedWindowShowIcon = false;
          focusedWindowSize = 0;
          id = "focusedWindow";
        }
        {
          id = "ocrScanner";
          enabled = true;
        }
      ];
      maximizeDetection = true;
      maximizeWidgetIcons = false;
      maximizeWidgetText = false;
      name = "Main Bar";
      noBackground = false;
      openOnOverview = false;
      popupGapsAuto = true;
      popupGapsManual = 4;
      position = 0;
      rightWidgets = [
        {
          enabled = false;
          id = "systemTray";
          trayAutoOverflow = true;
          trayMaxVisibleItems = 0;
          trayPopupSingleLine = true;
          trayUseInlineExpansion = true;
        }
        {
          enabled = true;
          id = "cpuUsage";
          minimumWidth = false;
        }
        {
          enabled = true;
          id = "memUsage";
          minimumWidth = false;
          showInGb = false;
          showSwap = false;
        }
        {
          enabled = true;
          id = "network_speed_monitor";
        }
        {
          enabled = true;
          id = "notificationButton";
        }
        {
          enabled = true;
          id = "battery";
          showBatteryPercent = true;
          showBatteryPercentOnlyOnBattery = false;
          showBatteryTime = false;
          showBatteryTimeOnlyOnBattery = false;
        }
        {
          enabled = true;
          id = "controlCenterButton";
          showAudioIcon = true;
          showAudioPercent = false;
          showBatteryIcon = false;
          showBluetoothIcon = true;
          showBrightnessIcon = false;
          showBrightnessPercent = false;
          showDoNotDisturbIcon = false;
          showIdleInhibitorIcon = false;
          showMicIcon = false;
          showMicPercent = false;
          showNetworkIcon = true;
          showPrinterIcon = false;
          showScreenSharingIcon = true;
          showVpnIcon = true;
        }
        {
          enabled = true;
          id = "vpn";
        }
      ];
      screenPreferences = [
        "all"
      ];
      scrollYBehavior = "workspace";
      shadowIntensity = 0;
      shadowOpacity = 60;
      showOnLastDisplay = true;
      spacing = 0;
      squareCorners = false;
      transparency = 0.32;
      useOverlayLayer = false;
      visible = true;
      widgetFollowInterfaceStyle = false;
      widgetOutlineColor = "primary";
      widgetOutlineEnabled = false;
      widgetOutlineOpacity = 0.07;
      widgetOutlineThickness = 1;
      widgetPadding = 13;
      widgetTransparency = 0.3;
    }
    {
      autoHide = false;
      autoHideDelay = 250;
      barInsetPadding = 4;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 2;
      bottomGap = 0;
      centerWidgets = [
        {
          audioScrollMode = "volume";
          enabled = true;
          id = "music";
          mediaAdaptiveWidthEnabled = true;
          mediaSize = 1;
        }
        {
          clockCompactMode = false;
          enabled = true;
          id = "clock";
        }
        {
          enabled = true;
          id = "weather";
        }
      ];
      clickThrough = false;
      dot = true;
      enabled = false;
      followInterfaceStyle = false;
      fontScale = 1;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 63;
      gothCornersEnabled = true;
      hoverPopoutDelay = 53;
      hoverPopouts = false;
      iconScale = 1;
      id = "dot1793040506360";
      innerPadding = 0;
      island = false;
      leftWidgets = [
        {
          dwlShowAllTags = false;
          enabled = true;
          groupActiveWorkspaceApps = false;
          groupWorkspaceApps = true;
          id = "workspaceSwitcher";
          maxWorkspaceIcons = 3;
          reverseScrolling = false;
          showOccupiedWorkspacesOnly = true;
          showWorkspaceApps = false;
          showWorkspaceIndex = true;
          showWorkspaceName = false;
          showWorkspacePadding = true;
          workspaceActiveAppHighlightEnabled = false;
          workspaceAppIconSizeOffset = 0;
          workspaceColorMode = "default";
          workspaceDragReorder = true;
          workspaceFocusedBorderColor = "primary";
          workspaceFocusedBorderCustomColor = "#6750A4";
          workspaceFocusedBorderEnabled = true;
          workspaceFocusedBorderThickness = 2;
          workspaceFocusedCustomColor = "#6750A4";
          workspaceFollowFocus = true;
          workspaceOccupiedColorMode = "none";
          workspaceOccupiedCustomColor = "#625B71";
          workspaceUnfocusedColorMode = "default";
          workspaceUnfocusedCustomColor = "#49454E";
          workspaceUnfocusedMonitorBorderColor = "primary";
          workspaceUnfocusedMonitorBorderCustomColor = "#6750A4";
          workspaceUnfocusedMonitorBorderEnabled = false;
          workspaceUnfocusedMonitorBorderThickness = 2;
          workspaceUnfocusedMonitorColorMode = "default";
          workspaceUnfocusedMonitorFocusedCustomColor = "#6750A4";
          workspaceUnfocusedMonitorOccupiedColorMode = "none";
          workspaceUnfocusedMonitorOccupiedCustomColor = "#625B71";
          workspaceUnfocusedMonitorSeparateAppearance = false;
          workspaceUnfocusedMonitorUnfocusedColorMode = "default";
          workspaceUnfocusedMonitorUnfocusedCustomColor = "#49454E";
          workspaceUnfocusedMonitorUrgentColorMode = "default";
          workspaceUnfocusedMonitorUrgentCustomColor = "#B3261E";
          workspaceUrgentColorMode = "default";
          workspaceUrgentCustomColor = "#B3261E";
        }
        {
          enabled = true;
          focusedWindowCompactMode = true;
          focusedWindowShowIcon = false;
          focusedWindowSize = 0;
          id = "focusedWindow";
        }
      ];
      maximizeDetection = true;
      maximizeWidgetIcons = false;
      maximizeWidgetText = false;
      name = "Dot";
      noBackground = false;
      openOnOverview = false;
      popupGapsAuto = true;
      popupGapsManual = 4;
      position = 0;
      rightWidgets = [
        {
          enabled = false;
          id = "systemTray";
          trayAutoOverflow = true;
          trayMaxVisibleItems = 0;
          trayPopupSingleLine = true;
          trayUseInlineExpansion = true;
        }
        {
          enabled = true;
          id = "cpuUsage";
          minimumWidth = false;
        }
        {
          enabled = true;
          id = "memUsage";
          minimumWidth = false;
          showInGb = false;
          showSwap = false;
        }
        {
          enabled = true;
          id = "network_speed_monitor";
        }
        {
          enabled = true;
          id = "notificationButton";
        }
        {
          enabled = true;
          id = "battery";
          showBatteryPercent = true;
          showBatteryPercentOnlyOnBattery = false;
          showBatteryTime = false;
          showBatteryTimeOnlyOnBattery = false;
        }
        {
          enabled = true;
          id = "controlCenterButton";
          showAudioIcon = true;
          showAudioPercent = false;
          showBatteryIcon = false;
          showBluetoothIcon = true;
          showBrightnessIcon = false;
          showBrightnessPercent = false;
          showDoNotDisturbIcon = false;
          showIdleInhibitorIcon = false;
          showMicIcon = false;
          showMicPercent = false;
          showNetworkIcon = true;
          showPrinterIcon = false;
          showScreenSharingIcon = true;
          showVpnIcon = true;
        }
        {
          enabled = true;
          id = "vpn";
        }
      ];
      screenPreferences = [
        "all"
      ];
      scrollYBehavior = "workspace";
      shadowIntensity = 0;
      shadowOpacity = 60;
      showOnLastDisplay = true;
      spacing = 0;
      squareCorners = false;
      transparency = 0.32;
      useOverlayLayer = false;
      visible = true;
      widgetFollowInterfaceStyle = false;
      widgetOutlineColor = "primary";
      widgetOutlineEnabled = false;
      widgetOutlineOpacity = 0.07;
      widgetOutlineThickness = 1;
      widgetPadding = 13;
      widgetTransparency = 0.3;
      islandCompactThickness = 32;
      islandSatelliteGap = 6;
    }
  ];
  desktopWidgetInstances = [
  
  ];
  desktopWidgetGroups = [
  
  ];
  builtInPluginSettings = {
    dms_clipboard_search = {
      trigger = "cb";
    };
    dms_power = {
      trigger = "pw";
    };
    dms_qr_generator = {
      trigger = "qrg";
    };
    dms_settings_search = {
      trigger = "?";
    };
  };
  clipboardClickToPaste = false;
  clipboardEnterToPaste = false;
  clipboardRememberTypeFilter = false;
  clipboardTypeFilter = "all";
  clipboardVisibleEntryActions = [
    "pin"
    "edit"
    "delete"
  ];
  launcherPluginVisibility = {
  
  };
  launcherPluginOrder = [
  
  ];
  frameEnabled = false;
  frameThickness = 6;
  frameRounding = 5;
  frameScreenPreferences = [
    "all"
  ];
  frameBarSize = 27;
  frameShowOnOverview = false;
  frameBlurEnabled = true;
  frameCloseGaps = true;
  frameLauncherEmergeSide = "bottom";
  frameLauncherArcExtender = false;
  frameLauncherEdgeHover = false;
  frameMode = "separate";
  barInsetPaddingShared = (-1);
  barInsetPaddingSyncAll = false;
  frameBarInsetPadding = (-1);
  configVersion = 42;
    };
 };
}
