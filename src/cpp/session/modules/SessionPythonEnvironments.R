#
# SessionPythonEnvironments.R
#
# Copyright (C) 2020 by RStudio, PBC
#
# Unless you have received this program directly from RStudio pursuant
# to the terms of a commercial license agreement with RStudio, then
# this program is licensed to you under the terms of version 3 of the
# GNU Affero General Public License. This program is distributed WITHOUT
# ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING THOSE OF NON-INFRINGEMENT,
# MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. Please refer to the
# AGPL (http://www.gnu.org/licenses/agpl-3.0.txt) for more details.
#
#

.rs.addFunction("python.findPythonEnvironments", function()
{
   pythonInstalls <- list()
   
   # look for virtualenvs
   envRoot <- Sys.getenv("WORKON_HOME", unset = "~/.virtualenvs")
   envPaths <- list.files(envRoot, full.names = TRUE)
   
   virtualEnvironments <- lapply(envPaths, .rs.python.getVirtualEnvironmentInfo)
   
})

.rs.addFunction("python.getVirtualEnvironmentInfo", function(envPath)
{
   # if this Python environment has a pyvenv.cfg file, then we can try
   # and use that to determine the version of Python used for this environment
   pyvenvPath <- file.path(envPath, "pyvenv.cfg")
   if (file.exists(pyvenvPath))
   {
      # read config file
      contents <- readLines(pyvenvPath, warn = FALSE)
      
      # find version line
      versionLine <- grep("^version\\s*=", contents, value = TRUE, perl = TRUE)
      
      # trim off version prefix
      version <- gsub("^version\\s*=\\s*", "", versionLine)
      
      # return data
      
      
      
   }
   
   # build path to Python executable
   exeSuffix <- if (Sys.info()[["sysname"]] == "Windows")
      "Scripts/python.exe"
   else
      "bin/python"
   
   exePath <- file.path(envPath, exeSuffix)
   
   
})
