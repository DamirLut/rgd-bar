draw_self();
draw_sprite(spr_head, 0, x, y - sprite_yoffset);

draw_set_halign(fa_center);
draw_text(x, y + 4, user.username);
draw_set_halign(fa_left);