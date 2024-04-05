void material_main(MaterialInfo material, vec4 color)
{
#ifndef DEPTH_ONLY
	uint v_19;
	float v_54;
	float v_58;
	vec2 v_62;
	float v_65;
	vec2 v_69;
	float v_72;
	float v_73;
	float v_74;
	vec2 v_79;
	vec2 v_83;
	float v_87;
	float v_90;
	vec4 v_96;
	vec4 v_100;
	vec4 v_103;
	float v_107;
	vec2 v_111;
	vec2 v_115;
	float v_118;
	float v_122;
	float v_125;
	float v_129;
	float v_132;
	vec3 v_137;
	vec2 v_141;
	vec2 v_145;
	vec2 v_149;
	float v_152;
	float v_153;
	vec3 v_158;
	vec3 v_163;
	float v_166;
	v_72 = i_coordw.x;
	v_73 = i_coordw.y;
	v_74 = i_coordw.z;
	v_69 = vec2(v_72, v_74);
	v_62 = v_69 * 0.1;
	v_65 = perlin(v_62);
	v_58 = v_65 / 4;
	v_54 = v_58 + 0.2;
	v_83 = v_69 * 0.7;
	v_79 = v_83 + vec2(152.4,76.6);
	v_90 = perlin(v_79);
	v_87 = v_90 * 0.4;
	v_107 = v_87 + 0.6;
	v_111 = v_69 * 0.98;
	v_115 = v_111 + vec2(67.9,178.7);
	v_118 = perlin(v_115);
	v_122 = v_118 * 0.5;
	v_129 = v_122 + 0.5;
	v_96 = hsvColor(v_54, v_107, v_129, 1);
	v_103 = v_96;
	v_100 = color * v_103;
	v_125 = 0;
	v_132 = 0.9;
	v_163 = vec3(0, 0, 0);
	v_166 = 1;
	v_141 = v_69 * 1.21;
	v_145 = v_141 + vec2(99.7,21.95);
	v_149 = perlin_gradient(v_145, 1.79);
	v_152 = v_149.x;
	v_153 = v_149.y;
	v_137 = vec3(v_152, 2, v_153);
	v_158 = normalize(v_137);
	vec4 o_color;
	vec3 o_normal;
	float o_metallic;
	float o_roughness;
	vec3 o_emissive;
	o_color = v_100;
	o_normal = v_158;
	o_metallic = v_125;
	o_roughness = v_132;
	o_emissive = v_163;
	#ifndef GBUFFER_PASS
	vec3 albedo = (1.0 - o_metallic) * o_color.rgb;
	vec3 f0 = mix(vec3(0.04), o_color.rgb, o_metallic);
	o_color = vec4(shading(i_coordw, o_normal, o_metallic, albedo, f0, o_roughness, 1.0, o_emissive, false), o_color.a);
	#else
	o_gbufferA = vec4(o_color.rgb, 0.0);
	o_gbufferB = vec4(o_normal * 0.5 + 0.5, 0.0);
	o_gbufferC = vec4(o_metallic, o_roughness, 0.0, 0.0);
	o_gbufferD = vec4(o_emissive, 0.0);
	#endif
#else
	#include <esm_value.glsl>
#endif
}
