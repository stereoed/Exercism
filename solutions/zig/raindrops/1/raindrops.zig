const std = @import("std");
pub fn convert(buffer: []u8, n: u32) []const u8 {
    var return_as_number: bool = true;
    var len: usize = 0;

    if (n % 3 == 0){
        return_as_number = false;
        @memcpy(buffer[len..][0..5], "Pling");
        len += 5;
    }

    if (n % 5 == 0){
        return_as_number = false;
        @memcpy(buffer[len..][0..5], "Plang");
        len += 5;
    }

    if (n % 7 == 0){
        return_as_number = false;
        @memcpy(buffer[len..][0..5], "Plong");
        len += 5;
    }
    
    if (return_as_number){
        return std.fmt.bufPrint(buffer, "{d}", .{n}) catch unreachable;
    }

    return buffer[0..len];
}

test "convert number to PlingPlangPlong" {
    var buf: [16]u8 = undefined;

    try std.testing.expectEqualStrings("1", convert(&buf, 1));
    try std.testing.expectEqualStrings("2", convert(&buf, 2));
    try std.testing.expectEqualStrings("Pling", convert(&buf, 3));
    try std.testing.expectEqualStrings("Plang", convert(&buf, 5));
    try std.testing.expectEqualStrings("Plong", convert(&buf, 7));
    try std.testing.expectEqualStrings("Pling", convert(&buf, 6));
    try std.testing.expectEqualStrings("Plang", convert(&buf, 10));
    try std.testing.expectEqualStrings("Plong", convert(&buf, 14));
    try std.testing.expectEqualStrings("PlingPlang", convert(&buf, 15));
    try std.testing.expectEqualStrings("PlingPlong", convert(&buf, 21));
    try std.testing.expectEqualStrings("PlangPlong", convert(&buf, 35));
    try std.testing.expectEqualStrings("PlingPlangPlong", convert(&buf, 105));
    try std.testing.expectEqualStrings("PlingPlangPlong", convert(&buf, 3 * 5 * 7 * 11));
}