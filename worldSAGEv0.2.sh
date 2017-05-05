#!/bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -pe smp 12 
#$ -j y

#make sure you understand the files
#it is only until then can you really manipulate them

cpu= 1 #edit to how many cpu you like. 
mem="$(($(grep MemTotal /proc/meminfo | meminfo |awk '{print $2}' ) * 85/100000000))G"
memJava="-Xmx$(($grep MemTotal /proc/meminfo | awk '{print $2}') * 85/100000000)g"
#memCdHit="$(($ grep MemTotal /proc/meminfo | awk '{print $2}') * 85/100000000))"

echo "CPU used: $cpu""
echo "Memory used: $mem""
echo -e "$(date)"

#write directories below


#in case the directories aren't made, make it here
#template: [ -d "$directoryName" ] || mkdir -p "$directoryName"


#read and analyse the current data


#the big process
#turning the cDNA into protein sequences if there is a better method please tell 
# t--> u
# [123][456]
# will have to either encorporate with a software that does this, or have a file that tells which chain pertains
#to which protein


#this finds all of the t's and changes them to a u
for k in $(find "$directoryName" -type f | grep ".file_extension");
	sed -i 's/t/u/g' "{$sampleName}.edited.file_extension"

done

#download the EMBOSS transeq directory when you can
for j in $(find "$directoryName" -type f | grep "*edited*");
	#EMBOSS' transeq
	transeq "{$sampleName}" "{$sampleName}" -table 0
done

#make an align the protein sequences with an NCBI version

for i in $(find "$directoryName" -type f | grep "*edited*");
	mothur > merge.files(input="{$sampleName}"-NCBIsequence.fasta, output="{$sampleName}.merged"
done

#analysis of the merged protein sequences
#
#for W in $(find "$directoryName" -type f | grep "*merged");
	#grep char -o NCBIsequence.fasta | -1 > NCBIsequence.analysis.txt
	#grep char -o "{$sampleName}" | -1 > "{$sampleName}".analysis.txt
#done
		
