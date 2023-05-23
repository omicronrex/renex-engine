/*
    tint
*/

return shader_pixel_create_base64("
    eJxNj8FKw0AQhr9NWhpEyAsI5mgvgVSK9FDF9uKhHrSCHoRaa8VC64Y0gsf15q15
    hL158NJn8FnyHK7sJlAXBub/ZuefGeEZ82tOGN6cDw6AL0B4xviA1QjQwB1gmcDj
    wXIgBbzqC+81+3RMOFbUbDxdpct5RoN9V7E1+6Yr+faa822d//OZXMoslwjHbdTz
    1pPO5JHLxSyTa/mcR0fX7ehiNB5F45fp0zyLhnKVLpbzLOrFnV7c63bi4yRJuIKm
    R6j7e7enm5/uWft+07d+h9X6CvztLg+LOi8IQj1wZ4cKyi1BqZs7baMIwBcETnuU
    ugENQUsJjBKUGsoPy6ClAC2qPiXsjKDyMQb+ABBERhs=
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

    uniform float amount;
    uniform float3 colorto;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        float4 diffuse = tex2D(Sampler,input.uv) * input.color;

        float gray = dot(diffuse.rgb,float3(0.21,0.71,0.07));

        output.color = float4(lerp(diffuse.rgb,float3(gray,gray,gray)*colorto,amount),diffuse.a);

        return output;
    }

*/
