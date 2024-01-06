// Notes:
//  $ zig version
//  0.12.0-dev.2059+42389cb9c
//
//  all conditionals are meant to be skipped, as to **not** enter
//  conditional blocks.
pub fn main() void {
    var pos: usize = 0;
    while (pos > 1) {
        pos += 1;
        @import("std").debug.print("hello world {d}", .{pos});
        return;
        // see the terminal below -- nothing written to stdout.
        // the instruction pointer isn't actually here,
        // it's just double mapped this while it's
        // wrapping up the `while` block traversal.
    }

    // same thing happens here during debug. weird!
    if (pos > 1) {
        pos += 1;
        @import("std").debug.print("hello world {d}", .{pos}); // debugger should never reach this!
        return;
    }

    return;
}
