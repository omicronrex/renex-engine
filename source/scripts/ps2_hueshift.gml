/*
    hueshift
*/

return shader_pixel_create_base64("
    eJxdkr1uE0EUhb+Z2SQGRawEpRGsRAMUFjaicENCQkFhCjArUSBFhhgRKcaWY/qx
    REfjRxjacZMngLQ8A63FY7Dozt0Yw65Ge+7Zc8/92TW2qn5XDzh89eTgJvAFMLaq
    LCAxBj4DTwGXQktPeOANIDoDHAMzoD8YTU6HUzJ2MenWazAaf/o4Yykum/z/1+Ts
    qHP0lucn76bjs/H7WXH35b3iWa/fK/ofBsfDaXE4Hk1OTofTotvqdFvdR53Ww3a7
    zQvYMuQB/N4y3t9bxvhY/IS35EE48N+FW8b4TXiX9Bf71a+fLdi/kHe3dSQP7vwv
    zhc1XtDIw0FaRe5hdU5jFQxYw663KLYJN8MWOKc6OYsMMrAeSjkLR5xrrvOOH15z
    jTeUNbby9K8hM8lH+JXU8eplvPbHwkDysmwnjeJGytcamTdU6xpuzV+RXmtsvaVM
    9XQ+Ui3xuwrOpHrSe+XtOk4+c+lH8qWeg+Aow3btKfOIvp59LvmbuzDJM/o7acfK
    beilRtB3WYpvrHGse73URTlzzb1WezeD6iW+3Jti7TPW3spp7q0al0HnFH+Z69+Z
    5PvKDurv5a9DZtlJGJqS/1X/gZ2NXWJp5N6x8lUFfwAcCZJz
")

/*
    SamplerState Sampler : register(s0);

    struct PS_INPUT {
        float4 position: POSITION0;
        float2 uv: TEXCOORD0;
        float4 color: COLOR;
    };

    struct PS_OUTPUT {
        float4 color: COLOR;
    };

    float3 rgb2hsv(float3 c) {
      float4 K = float4(0.f, -1.f / 3.f, 2.f / 3.f, -1.f);
      float4 p = c.g < c.b ? float4(c.bg, K.wz) : float4(c.gb, K.xy);
      float4 q = c.r < p.x ? float4(p.xyw, c.r) : float4(c.r, p.yzx);

      float d = q.x - min(q.w, q.y);
      float e = 1e-10;
      return float3(abs(q.z + (q.w - q.y) / (6.f * d + e)), d / (q.x + e), q.x);
    }

    float3 hsv2rgb(float3 c) {
      float4 K = float4(1.f, 2.f / 3.f, 1.f / 3.f, 3.f);
      float3 p = abs(frac(c.xxx + K.xyz) * 6.f - K.www);
      return c.z * lerp(K.xxx, saturate(p - K.xxx), c.y);
    }

    uniform float amount = 0;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        float4 diffuse = tex2D(Sampler,input.uv) * input.color;

        float3 hsv = rgb2hsv(diffuse.rgb);
        hsv.x = fmod(hsv.x + amount, 1);

        output.color=float4(hsv2rgb(hsv), diffuse.a);

        return output;
    }

*/
