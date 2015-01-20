#include <iostream>
#include "editor-support/cocostudio/FlatBuffersSerialize.h"
#include <dirent.h>
#include <sys/stat.h>
#include <unistd.h>

using namespace std;

cocostudio::FlatBuffersSerialize fbs;

void serialize(const std::string root, const std::string input)
{
  char buf[255];
  getcwd(buf,255);
  std::string curdir(buf);
  mkdir((curdir + "/output").c_str(), 0755);
  std::string output = curdir + "/output" + input.substr(root.size());
  printf("Process: %s \n", output.c_str());
  std::string dirname =  output.substr(0, output.find_last_of('/'));
  mkdir(dirname.c_str(), 0755);
  fbs.serializeFlatBuffersWithXMLFile(input, output);
}

void processDir(const std::string root, const std::string& dirname)
{
  DIR *dir;
  struct dirent *ent;
  if((dir = opendir(dirname.c_str())) == NULL){
    return;
  }
  while((ent = readdir(dir)) != NULL){
    string fname = ent->d_name;

    switch(ent->d_type){
    case DT_DIR: {
      if      (fname == "."){
        continue;
      }else if(fname == ".."){
        continue;
      }
      stringstream buf;
      buf << dirname;
      buf << "/";
      buf << fname;
      processDir(root, buf.str().c_str());
      continue;
    }
    case DT_REG: {
      string extname = fname.substr(fname.find_last_of('.'));
      if(extname == ".csd"){
        serialize(root, dirname + "/" +fname);
      }
      continue;
    }
    }
  }
  closedir(dir);
}

int main(int argc, char *argv[])
{
  if(argc < 2){
    cout << "USAGE: " ;
    cout << argv[0];
    cout << " COCOSTUDIO_DIR";
    return -1;
  }
  
  auto root = argv[1];
  processDir(root, root);
}
