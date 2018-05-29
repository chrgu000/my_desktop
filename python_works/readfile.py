fileName = 'mzr.txt';

with open(fileName) as fileObject:
    #~ contents = fileObject.read();
    #~ print(contents);
    #~ for line in fileObject:
        #~ print(line.rstrip());
    lines = fileObject.readlines();

#~ print(lines);
for line in lines:
    print(line.rstrip());
