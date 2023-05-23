return shader_vertex_create_base64("
    eJxdkMtKw0AUhr+ZSayVQl5AMEvdFFpR6KreEBcteKu6K8VbA0okLeJyHiFbd3Hb
    vISP4CO4yMqHaGRmUkUHAuf/zpn/5B8h5+W83Gb/fHdvFcgAIeelAoxGwCtwBUiW
    jeTGcGBqmYcH6IqllvGHPUT34+lTPCHPc4FCIK2POUl/NE2il4tj8lyhrNu/3iXP
    k2F7OKIfXSfxJL6bhuunG+FR76wXno1HN7dJuB8/PkUPt0nYabY7zc5Wu7nZarXM
    vhPw6wQmVped1UPnrLtr7jc1BKmpfdCiqldAS4LUBwWBhkEqKDLPxjK6MH4pFHrB
    pGWzP0xZVlomQQmUuauXKd6Mt6ChBQf2c31PC0otmOkaSKdn2s0qWwsK3ahmJWVa
    h+y3X9gZt9/pOoPM7HQzNov2qyxGey6LnV2wJZflh0HwXnNZqh3m7dSnoEhdHXzU
    +crKEr4Bq0FyyQ==
")

/*
    struct VS_INPUT {
       float4 position: POSITION;
       float2 texcoord: TEXCOORD0;
       float4 color: COLOR;
    };

    struct VS_OUTPUT {
       float4 position: POSITION;
       float2 texcoord: TEXCOORD0;
       float4 color: COLOR;
    };

    matrix rMatrixW;
    matrix rMatrixVP;

    float2 lightpos;

    VS_OUTPUT main (VS_INPUT input) {
        VS_OUTPUT output;

        float4 pos = mul(rMatrixW, input.position);

        if (input.color.a<0.5) {
            pos.xy+=10000*normalize(pos.xy-lightpos);
        }

        output.position = mul(rMatrixVP, pos);
        output.texcoord=input.texcoord;
        output.color=float4(0,0,0,1);

        return output;
    }
*/
