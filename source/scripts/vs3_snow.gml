return shader_vertex_create_base64("
    eJxNkLFKA0EQhr+93YMUgQNrwSu1CSZBMFiIprFIRI1Ruxj0ggfKhbsgFhb7ABYp
    fIAtrHIP4QvoO1hc7SPkZDcnZLbZ+eeff/4Z5LJclvt0L4+ON4EcQC5LCdgcAR/A
    DeChbMqtxYGpw0ABrxX2ZttXbbxXWDKZZNGMXCARlYaNtD+epfHL9dUZuUSi1mrZ
    aRJnEbmijnBvFc/ZqD3apR/fpUmWTGbh9sVOeNIb9MLBw/g+SsNu8jSNH6M07DRa
    nUZnr9VoN5tNzsH3CQxwsFLSh99fvc+t1Qoagnn1n1MLzBr+I9y/rn2GxgMpkFpR
    GCjmPkgPqQWF9sFYrnDcwih3GstdGMGv9ij0yJ0n0FBoaoXje5W2rXkEjmdrG6AE
    SsNibr14oP81BQutKE01VwqnObQ+qrluht3XebO+7S52rqQwZQl/indcFg==
")

/*
        struct VS_INPUT {
            float4 position: POSITION0;
            float2 texcoord: TEXCOORD0;
            float4 color: COLOR0;
        };

        struct VS_OUTPUT {
            float4 position: POSITION0;
        };

        SamplerState sNoise;
        matrix rMatrixWVP;
        float4 offset;

        VS_OUTPUT main(VS_INPUT input) {
            VS_OUTPUT output;

            input.position.xy+=offset.xy;

            float2 u=float2(offset.z,-offset.z*0.8);

            float2 texcoord=input.position.xy/512.0;

            input.position.x+=lerp(tex2D(sNoise, texcoord).r,tex2D(sNoise, texcoord+u).r,input.position.z)*offset.w;
            input.position.y+=lerp(tex2D(sNoise, texcoord).r,tex2D(sNoise, texcoord+u).r,input.position.z)*offset.w;

            input.position.z=0.0;
            input.position.w=1.0;

            output.position = mul(rMatrixWVP, input.position);

            return output;
        }

*/
