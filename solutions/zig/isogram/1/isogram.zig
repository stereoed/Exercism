const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    var seen= std.bit_set.IntegerBitSet(26).initEmpty();

    for (str) |byte| {
        const bit: u8 = switch (byte){
            'a'...'z' => @intCast(byte - 'a'),
            'A'...'Z' => @intCast(byte - 'A'),
            else => continue,            
        };

        if (seen.isSet(bit)){
            return false;
        }
        seen.set(bit);        
    }

    return true;
}
