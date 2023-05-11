var _channel = animcurve_get_channel(ac_rgdbar, 0);
intensity = animcurve_channel_evaluate(_channel, sin(current_time/1000));

fx_set_parameter(effect, effect_key, intensity);