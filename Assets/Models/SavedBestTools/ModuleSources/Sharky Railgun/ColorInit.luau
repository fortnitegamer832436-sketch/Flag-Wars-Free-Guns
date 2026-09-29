return function(tool, team)
    local parts = tool:FindFirstChild("Parts")
    local main = parts and parts:FindFirstChild("Main")

    if not main or not main:FindFirstChild("TipAttachment") then
        return
    end

    local isRed = team and team.Name == "Team Red"
    local textureId = isRed and "rbxassetid://14030578183" or "rbxassetid://14030578232"
    local neonColor = isRed and Color3.fromRGB(165, 70, 70) or Color3.fromRGB(0, 121, 165)
    local particleColor = isRed and Color3.fromRGB(255, 48, 48) or Color3.fromRGB(0, 170, 255)
    local beamColor = isRed and Color3.fromRGB(255, 62, 62) or Color3.fromRGB(19, 121, 255)

    main.TextureID = textureId

    local neon = parts:FindFirstChild("Neon")
    if neon then
        neon.Color = neonColor
    end

    for _, descendant in ipairs(parts:GetDescendants()) do
        if descendant:IsA("ParticleEmitter") and descendant.Name == "ChargingParticles" then
            descendant.Color = ColorSequence.new(particleColor)
        end
    end

    for _, child in ipairs(main:GetChildren()) do
        if child:IsA("Beam") and child.Name == "ChargingBeam" then
            child.Color = ColorSequence.new(beamColor)
        end
    end
end
