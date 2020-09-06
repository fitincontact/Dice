function sumdigits(str)
    local total = 0
    for digit in string.gmatch(str, "%d") do
        total = total + digit
    end
    return total
end

function mapdigitonarray(digit, array)
    local res = 1
    for i = 1, digit do
        res = res + 1
        if (res > array) then
            res = 1
        end
    end
    return  res
end

