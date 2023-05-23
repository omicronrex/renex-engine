/*
    ps-rainbow
*/

return shader_pixel_create_base64("
    eJxdkb1uE1EQhb977xpWBrIWtKBYUPBTWHEChaWIhKShMFKCWSlUUQRGREpky8kD
    jGs3W0C/tLstNeQtKGgoNrwDDRfN3Q1B7GqkmXPP/J3Bef/b32X71bOt28AIwHlv
    AI0xMARWFA6hZV1xYDY6OJ4ejWeUZRlxHRP++pue7K/tr/Di8M1scjJ5d9p98PJh
    9/lwNOyO3h+8Hc+625Pj6eHReNYd9FYHvcGT1d5av99nF1qQ5HC26X9+77W/3VuH
    zTPFTcBloywebZRF8VT7KG4bvO4sX/VdcfcPXhbFF623DLYFAi5Tvw1iSIKvyXRq
    HMiIk9yGtY3QSTM6ZK0QWwlcivxW4GqcLvYgCtzwlqrNt8AZEoEqI65yzbckYqjU
    sijkWDGkapmlmCvmSMTyWhw7ueNjrlhEIo5dsezklvN8r+FpL8dniYJd1NO9yBzM
    jc4Yx2LxilnLkjgeB99xTSz3RWvVc6ZiqcRRSbvZtZ7NS61F2FVrNr2iZldySPMr
    QQ/FioYfa/5c8y/5Prybv5wLzYpFrady+E/PQm1e828EzPCh0V/jqqlf+/U8vrnf
    HcUWDj5pbBp9HD7MW8epXN423EJuBk2Wmv1+iINwP+KrYvgVangPfwDlLpiE
")

/*
    SamplerState rSampler: register(s0);

    struct PS_INPUT {
        float4 position: POSITION0;
        float2 texcoord: TEXCOORD0;
        float4 color: COLOR;
        float4 screenpos: VPOS;
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

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        float4 albedo = tex2D(rSampler,input.texcoord) * input.color;

        float3 hsv = rgb2hsv(albedo.rgb);

        float amount = fmod(input.screenpos.x+input.screenpos.y,100)/100;

        hsv.x = fmod(hsv.x + amount, 1);

        output.color=float4(hsv2rgb(hsv), albedo.a);

        return output;
    }

*/
