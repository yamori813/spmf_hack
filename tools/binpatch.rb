#
# binary path for reverse engineering
#

argc = ARGV.size
if argc >= 4 && argc % 2 == 0 then
  old = ARGV[0]
  new = ARGV[1]
  p = 2
  bindata = File.binread(old)
  while 2 + p <= argc
    offset = ARGV[p].hex
    inst = ARGV[p+1].hex

    bindata[offset] =  (inst >> 24).chr
    bindata[offset + 1] =  ((inst >> 16) & 0xff).chr
    bindata[offset + 2] =  ((inst >> 8) & 0xff).chr
    bindata[offset + 3] =  (inst & 0xff).chr
    p = p + 2
  end
  File.binwrite(new, bindata)
else
  print "usage: binpatch.rb oldfile newfile offset data\n"
end
