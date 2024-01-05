const std = @import("std");
const Weird = struct {
    pos: usize,
    hay: []const u8,

    pub fn next(this: *@This()) ?[]const u8 {
        var c = this.hay[this.pos .. this.pos + 1];
        while (this.pos < this.hay.len and std.mem.indexOf(u8, " \t\n\r", c) != null) {
            this.pos += 1;
            return this.hay[this.pos .. this.pos + 1];
        }

        return null;
    }
};

pub fn main() !void {
    var weird = Weird{
        .pos = 0,
        .hay = "this is my haystack",
    };
    while (weird.next()) |next| {
        std.debug.print("should not happen {s}", .{next});
        unreachable;
    }
    std.debug.print("alles gut", .{});
}
