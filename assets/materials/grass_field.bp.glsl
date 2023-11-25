void material_main(MaterialInfo material, vec4 color)
{
#ifndef DEPTH_ONLY
	uint v_20;
	float v_54;
	vec2 v_58;
	float v_62;
	vec2 v_66;
	float v_70;
	float v_73;
	float v_74;
	float v_75;
	vec2 v_80;
	vec2 v_84;
	vec4 v_90;
	vec4 v_94;
	vec4 v_97;
	float v_100;
	float v_104;
	float v_108;
	float v_112;
	vec2 v_116;
	float v_119;
	vec2 v_123;
	vec2 v_127;
	vec2 v_131;
	vec3 v_136;
	vec3 v_139;
	float v_142;
	float v_145;
	float v_149;
	vec2 v_153;
	float v_157;
	float v_160;
	float v_164;
	float v_167;
	vec2 v_171;
	float v_174;
	float v_177;
	vec3 v_182;
	float v_185;
	v_167 = 0;
	v_177 = 0.9;
	v_182 = vec3(0, 0, 0);
	v_185 = 1;
	v_73 = i_coordw.x;
	v_74 = i_coordw.y;
	v_75 = i_coordw.z;
	v_58 = vec2(v_73, v_75);
	v_66 = v_58 * 2;
	v_54 = perlin(v_66);
	v_62 = v_54 / 6;
	v_70 = v_62 + 0.2;
	v_84 = v_58 * 0.7;
	v_80 = v_84 + vec2(152.445,76.6);
	v_100 = perlin(v_80);
	v_104 = v_100 * 0.4;
	v_108 = v_104 + 0.6;
	v_123 = v_58 * 0.98;
	v_127 = v_123 + vec2(67.9,178.67);
	v_145 = perlin(v_127);
	v_149 = v_145 * 0.5;
	v_157 = v_149 + 0.5;
	v_90 = hsvColor(v_70, v_108, v_157, 1);
	v_97 = v_90;
	v_94 = color * v_97;
	v_131 = v_58 + vec2(0.1,0);
	v_142 = perlin(v_131);
	v_116 = v_58 - vec2(0.1,0);
	v_119 = perlin(v_116);
	v_112 = v_142 - v_119;
	v_171 = v_58 + vec2(0,0.1);
	v_174 = perlin(v_171);
	v_153 = v_58 - vec2(0,0.1);
	v_160 = perlin(v_153);
	v_164 = v_174 - v_160;
	v_136 = vec3(v_112, 1, v_164);
	vec4 o_color;
	vec3 o_normal;
	float o_metallic;
	float o_roughness;
	vec3 o_emissive;
	o_color = v_94;
	o_normal = v_136;
	o_metallic = v_167;
	o_roughness = v_177;
	o_emissive = v_182;
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
	v_139 = normalize(v_136);
#else
	#include <esm_value.glsl>
#endif
}
