void material_main(MaterialInfo material, vec4 color)
{
#ifndef DEPTH_ONLY
	uint v_20;
	float v_54;
	vec2 v_58;
	float v_62;
	float v_66;
	vec2 v_70;
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
	vec2 v_112;
	vec2 v_116;
	float v_119;
	float v_123;
	float v_127;
	float v_130;
	float v_133;
	vec3 v_138;
	float v_141;
	v_73 = i_coordw.x;
	v_74 = i_coordw.y;
	v_75 = i_coordw.z;
	v_70 = vec2(v_73, v_75);
	v_58 = v_70 * 0.1;
	v_54 = perlin(v_58);
	v_62 = v_54 / 4;
	v_66 = v_62 + 0.2;
	v_84 = v_70 * 0.7;
	v_80 = v_84 + vec2(152.4,76.6);
	v_100 = perlin(v_80);
	v_104 = v_100 * 0.4;
	v_112 = v_70 * 0.98;
	v_116 = v_112 + vec2(67.9,178.7);
	v_119 = perlin(v_116);
	v_123 = v_119 * 0.5;
	v_127 = v_123 + 0.5;
	v_108 = v_104 + 0.6;
	v_90 = hsvColor(v_66, v_108, v_127, 1);
	v_97 = v_90;
	v_94 = color * v_97;
	v_130 = 0;
	v_133 = 0.9;
	v_138 = vec3(0, 0, 0);
	v_141 = 1;
	vec4 o_color;
	vec3 o_normal;
	float o_metallic;
	float o_roughness;
	vec3 o_emissive;
	o_color = v_94;
	o_normal = i_normal;
	o_metallic = v_130;
	o_roughness = v_133;
	o_emissive = v_138;
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
