function sgn(φ, Δx)
    if φ > Δx
        return 1
    elseif φ < -Δx
        return -1
    else
        s = φ/sqrt(φ^2 + (Δx)^2)
        return s
    end
end