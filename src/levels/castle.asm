; rom start, rom end for castle leveldata
.definelabel _castle_segment_7SegmentRomStart, 0x3D00000

.headersize 0x07000000-_castle_segment_7SegmentRomStart
.org 0x07000000
; .area _castle_segment_7SegmentRomEnd - _castle_segment_7SegmentRomStart
.importobj "obj/levels/castle/leveldata.o"

.definelabel _castle_segment_7SegmentRomEnd, orga()

// Just after the leveldata ends, starts this.
.headersize 0x0E000000-_castle_segment_7SegmentRomEnd
.org 0x0E000000
.definelabel _castleSegmentRomStart, orga()
.importobj "obj/levels/castle/geo.o"
.importobj "obj/levels/castle/script.o"
.definelabel _castleSegmentRomEnd, orga()
