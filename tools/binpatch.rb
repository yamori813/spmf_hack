#
# binary path for reverse engineering
#

if ARGV.size === 4 then
  old = ARGV[0]
  new = ARGV[1]
  offset = ARGV[2].hex
  inst = ARGV[3].hex
  
  bindata = File.binread(old)
  bindata[offset] =  (inst >> 24).chr
  bindata[offset + 1] =  ((inst >> 16) & 0xff).chr
  bindata[offset + 2] =  ((inst >> 8) & 0xff).chr
  bindata[offset + 3] =  (inst & 0xff).chr
  File.binwrite(new, bindata)
else
  print "usage: binpatch.rb oldfile newfile offset data\n"
end
