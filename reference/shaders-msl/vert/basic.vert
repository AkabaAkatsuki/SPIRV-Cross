#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct UBO
{
    float4x4 uMVP;
};

struct main0_in
{
    float3 aNormal [[attribute(1)]];
    float4 aVertex [[attribute(0)]];
};

struct main0_out
{
    float3 vNormal [[user(locn0)]];
    float4 gl_Position [[position]];
    float gl_PointSize;
};

vertex main0_out main0(main0_in in [[stage_in]], constant UBO& _16 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_Position = _16.uMVP * in.aVertex;
    out.vNormal = in.aNormal;
    out.gl_Position.y = -(out.gl_Position.y);    // Invert Y-axis for Metal
    return out;
}

