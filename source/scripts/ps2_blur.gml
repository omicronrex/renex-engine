/*
    ps-blur
*/

return shader_pixel_create_base64("
    eJxNkLtKA0EUhr+Z3ZAIwjYWFoJbahNIxCKIURMLiyhqtI5RIwkkbtjEQrAY8QH0
    EdbWNPEdxKewDIjgM7hyJpvLTDP/d/5zG6Xj+C/OUj7bK60AT4DScawB0Sh4APYB
    x0rNsXDgAhCfAtoJC6v1TrfdCBkMBi6LKHuTWKMXtO/6reCWgcKxtSaxbq+Wr11y
    2LoKg15w0/fXTtf9g0q14leb9etG6JeDTrfVboR+IZsvZAub+exGLpfjBFIKL1ra
    et9Z/n4tft43i78fR7vCNV709fO8zdxZHY9swBkm7xcyXlSy63kGRkMyo0iBViwY
    xShywdU4EhNuPcLUjD1OmDNl8dTnzpj1SS+NZzQjI71EKzzpNdUOnnHmtItn3ESn
    bH7a5ivOk/nS0sMo3iLh4/nStqZ45pnU1RBJTBikbe0Jk93J2L8wcQz/MNJzDQ==
")

/*
    SamplerState rSampler: register(s0);

    struct PS_INPUT {
        float4 position: POSITION0;
        float2 texcoord: TEXCOORD0;
        float4 color: COLOR;
    };

    struct PS_OUTPUT {
        float4 color: COLOR;
    };

    static const float offset[3] = {0.0, 1.3846153846, 3.2307692308};
    static const float weight[3] = {0.2270270270, 0.3162162162, 0.0702702703};

    float2 resolution;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        float4 albedo = tex2D(rSampler, input.texcoord);

        float3 accum = albedo.rgb * weight[0];

        for (int i=1; i<3; i++) {
            float2 off=offset[i]*resolution;
            accum += tex2D(rSampler, input.texcoord + off).rgb * weight[i];
            accum += tex2D(rSampler, input.texcoord - off).rgb * weight[i];
        }

        output.color = float4(accum.rgb,albedo.a);

        return output;
    }

*/
