.headersize 0x07000000-_castleSegmentRomEnd
.org 0x07000000
.definelabel _donjon_segment_7SegmentRomStart, orga()

.importobj "obj/levels/donjon/leveldata.o"

.definelabel _donjon_segment_7SegmentRomEnd, orga()

// Just after the leveldata ends, starts this.
.headersize 0x0E000000-_donjon_segment_7SegmentRomEnd
.org 0x0E000000
.definelabel _donjonSegmentRomStart, orga()

.importobj "obj/levels/donjon/geo.o"
.importobj "obj/levels/donjon/script.o"

.definelabel _donjonSegmentRomEnd, orga()
