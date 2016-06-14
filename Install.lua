shell.run("copy", "/disk/gitinstall","gitinstall")
shell.run("copy", "/disk/updateGITLUA","updateGITLUA")
shell.run("mkdir", "GitApi")
shell.run("copy", "/disk/GitApi/GitApi","GitApi/GitApi")

os.loadAPI("/GitApi/GitApi")
GitApi.getPackage("liltine", "CCmoqleshron", "master", "GITLUA")
GitApi.getPackage("liltine", "MultiThreading", "master", "MT")
