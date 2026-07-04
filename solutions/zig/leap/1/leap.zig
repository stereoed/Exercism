pub fn isLeapYear(year: u32) bool {
    if (@mod(year, 4) > 0) return false;
    if (@mod(year, 100) == 0 and @mod(year, 400) > 0) return false;
    return true;
}