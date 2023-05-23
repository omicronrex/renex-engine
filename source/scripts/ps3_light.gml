/*
    ps-light
*/

return shader_pixel_create_base64("
    eJxNj01OwkAUx38zBWmiCRzAxC51QwTiAjdG2LjAhSKJcUMIoJCUtCkcYLxBD+Ci
    boWdV+o5HDOvWGzykv/nmz48a3/sNf2n294p8A3gWesBjqNgBzwDGuUoM6cDG9Ek
    gtlrqauLpvnYa+HybbGZRiHb7VbhoahIp/TiaH3w3BRfMpys4nCeOK/Cibz+58Xr
    cWd8yf1ymkTr6HUTnD9eBHeD4SAYLiazeRL0o1W8DOdJ0G22u83uVbvZabVaPEBV
    U8+KLeZmv44z0FU5w0sdlpMaJU7x65mW0zwD+SeNPH2BCijHZTRkNck7DXP0Dxdd
    we/wlRWeNg5XS28k2WPw1KFX+gpkCl4TX5FnPcnX3T+k+HmmZLdvNKOi64vnssZa
    +AVrIVKG
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

    float3 lightpos; //x,y,range
    float4 lightcol;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        float range = lightpos.z;
        float falloff = pow(max(0,(range-distance(input.screenpos.xy,lightpos.xy))/range),2);

        float4 final = float4((lightcol.rgb * falloff),1);

        output.color = tex2D(rSampler,input.texcoord) * final;

        return output;
    }

*/
