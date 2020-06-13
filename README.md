# fibaro-device-timer
General-purpose device timer virtual device setup, with accompanying scenes.
* Supports independent device control with flexible timeframes
* Efficient on HC2's CPU, doesn't operate like regular scenes running trigger detection continuously 24/7, instead uses efficient intra-VD state checks
* Button code need not be updated manually for every device, auto-updates itself
* Also auto-updates for initialization of requisite globals, in case of a dirty install
