const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var seen = std.bit_set.IntegerBitSet(26).initEmpty();

    for (str) |c|{
        const bit: u5 = switch (c) {
            'a'...'z' => @intCast(c - 'a'),
            'A'...'Z' => @intCast(c - 'A'),
            else => continue
        };

        seen.set(bit);
    }

    return seen.count() == seen.capacity();
}