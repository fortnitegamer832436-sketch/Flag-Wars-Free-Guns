local TweenService = game:GetService("TweenService")

return function()
    local parts = script.Parent:FindFirstChild("Parts")
    local main = parts and parts:FindFirstChild("Main")
    local motor = main and main:FindFirstChild("Motor6D")
    local tipAttachment = main and main:FindFirstChild("TipAttachment")

    if not motor or not tipAttachment then
        return
    end

    TweenService:Create(
        motor,
        TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        { C0 = motor.C0 * CFrame.Angles(0, 0, 2.9670597283903604) }
    ):Play()

    for _, child in ipairs(tipAttachment:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Emit(1)
        end
    end
end
