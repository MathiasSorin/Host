/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
if(highlight) shader_set(HighlightShader)

var texture = sprite_get_texture(sprite_index, image_index)
var texture_width = texture_get_texel_width(texture)
var texture_height = texture_get_texel_height(texture)

shader_set_uniform_f(uniForm_Handle, texture_width, texture_height)

draw_self()
shader_reset()