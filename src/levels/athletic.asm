.headersize 0x07000000-_donjonSegmentRomEnd
.org 0x07000000
.definelabel _athletic_segment_7SegmentRomStart, orga()

.importobj "obj/levels/athletic/leveldata.o"

.definelabel _athletic_segment_7SegmentRomEnd, orga()

// Just after the leveldata ends, starts this.
.headersize 0x0E000000-_athletic_segment_7SegmentRomEnd
.org 0x0E000000
.definelabel _athleticSegmentRomStart, orga()

.importobj "obj/levels/athletic/geo.o"
.importobj "obj/levels/athletic/script.o"

.definelabel _athleticSegmentRomEnd, orga()
