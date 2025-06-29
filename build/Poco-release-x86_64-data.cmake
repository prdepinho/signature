########### AGGREGATED COMPONENTS AND DEPENDENCIES FOR THE MULTI CONFIG #####################
#############################################################################################

list(APPEND poco_COMPONENT_NAMES Poco::Foundation Poco::Crypto Poco::Data Poco::Encodings Poco::JSON Poco::Net Poco::XML Poco::DataMySQL Poco::DataPostgreSQL Poco::DataSQLite Poco::JWT Poco::MongoDB Poco::Redis Poco::Util Poco::ActiveRecord Poco::NetSSL Poco::Zip)
list(REMOVE_DUPLICATES poco_COMPONENT_NAMES)
if(DEFINED poco_FIND_DEPENDENCY_NAMES)
  list(APPEND poco_FIND_DEPENDENCY_NAMES PCRE2 expat SQLite3 PostgreSQL libmysqlclient OpenSSL ZLIB)
  list(REMOVE_DUPLICATES poco_FIND_DEPENDENCY_NAMES)
else()
  set(poco_FIND_DEPENDENCY_NAMES PCRE2 expat SQLite3 PostgreSQL libmysqlclient OpenSSL ZLIB)
endif()
set(PCRE2_FIND_MODE "NO_MODULE")
set(expat_FIND_MODE "NO_MODULE")
set(SQLite3_FIND_MODE "NO_MODULE")
set(PostgreSQL_FIND_MODE "NO_MODULE")
set(libmysqlclient_FIND_MODE "NO_MODULE")
set(OpenSSL_FIND_MODE "NO_MODULE")
set(ZLIB_FIND_MODE "NO_MODULE")

########### VARIABLES #######################################################################
#############################################################################################
set(poco_PACKAGE_FOLDER_RELEASE "C:/Users/Paulo/.conan2/p/pococda65b254f438/p")
set(poco_BUILD_MODULES_PATHS_RELEASE )


set(poco_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_RES_DIRS_RELEASE )
set(poco_DEFINITIONS_RELEASE "-DPOCO_NO_AUTOMATIC_LIBS"
			"-DPOCO_STATIC=ON"
			"-DPOCO_UNBUNDLED")
set(poco_SHARED_LINK_FLAGS_RELEASE )
set(poco_EXE_LINK_FLAGS_RELEASE )
set(poco_OBJECTS_RELEASE )
set(poco_COMPILE_DEFINITIONS_RELEASE "POCO_NO_AUTOMATIC_LIBS"
			"POCO_STATIC=ON"
			"POCO_UNBUNDLED")
set(poco_COMPILE_OPTIONS_C_RELEASE )
set(poco_COMPILE_OPTIONS_CXX_RELEASE )
set(poco_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_BIN_DIRS_RELEASE )
set(poco_LIBRARY_TYPE_RELEASE STATIC)
set(poco_IS_HOST_WINDOWS_RELEASE 1)
set(poco_LIBS_RELEASE PocoZipmd PocoNetSSLmd PocoActiveRecordmd PocoUtilmd PocoRedismd PocoMongoDBmd PocoJWTmd PocoDataSQLitemd PocoDataPostgreSQLmd PocoDataMySQLmd PocoXMLmd PocoNetmd PocoJSONmd PocoEncodingsmd PocoDatamd PocoCryptomd PocoFoundationmd)
set(poco_SYSTEM_LIBS_RELEASE ws2_32 iphlpapi crypt32)
set(poco_FRAMEWORK_DIRS_RELEASE )
set(poco_FRAMEWORKS_RELEASE )
set(poco_BUILD_DIRS_RELEASE )
set(poco_NO_SONAME_MODE_RELEASE FALSE)


# COMPOUND VARIABLES
set(poco_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_COMPILE_OPTIONS_C_RELEASE}>")
set(poco_LINKER_FLAGS_RELEASE
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_SHARED_LINK_FLAGS_RELEASE}>"
    "$<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_EXE_LINK_FLAGS_RELEASE}>")


set(poco_COMPONENTS_RELEASE Poco::Foundation Poco::Crypto Poco::Data Poco::Encodings Poco::JSON Poco::Net Poco::XML Poco::DataMySQL Poco::DataPostgreSQL Poco::DataSQLite Poco::JWT Poco::MongoDB Poco::Redis Poco::Util Poco::ActiveRecord Poco::NetSSL Poco::Zip)
########### COMPONENT Poco::Zip VARIABLES ############################################

set(poco_Poco_Zip_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Zip_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Zip_BIN_DIRS_RELEASE )
set(poco_Poco_Zip_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Zip_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Zip_RES_DIRS_RELEASE )
set(poco_Poco_Zip_DEFINITIONS_RELEASE )
set(poco_Poco_Zip_OBJECTS_RELEASE )
set(poco_Poco_Zip_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_Zip_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Zip_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Zip_LIBS_RELEASE PocoZipmd)
set(poco_Poco_Zip_SYSTEM_LIBS_RELEASE )
set(poco_Poco_Zip_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Zip_FRAMEWORKS_RELEASE )
set(poco_Poco_Zip_DEPENDENCIES_RELEASE Poco::Util Poco::XML)
set(poco_Poco_Zip_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Zip_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Zip_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Zip_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Zip_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Zip_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Zip_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Zip_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Zip_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Zip_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::NetSSL VARIABLES ############################################

set(poco_Poco_NetSSL_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_NetSSL_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_NetSSL_BIN_DIRS_RELEASE )
set(poco_Poco_NetSSL_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_NetSSL_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_NetSSL_RES_DIRS_RELEASE )
set(poco_Poco_NetSSL_DEFINITIONS_RELEASE )
set(poco_Poco_NetSSL_OBJECTS_RELEASE )
set(poco_Poco_NetSSL_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_NetSSL_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_NetSSL_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_NetSSL_LIBS_RELEASE PocoNetSSLmd)
set(poco_Poco_NetSSL_SYSTEM_LIBS_RELEASE )
set(poco_Poco_NetSSL_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_NetSSL_FRAMEWORKS_RELEASE )
set(poco_Poco_NetSSL_DEPENDENCIES_RELEASE Poco::Crypto Poco::Util Poco::Net)
set(poco_Poco_NetSSL_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_NetSSL_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_NetSSL_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_NetSSL_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_NetSSL_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_NetSSL_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_NetSSL_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_NetSSL_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_NetSSL_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_NetSSL_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::ActiveRecord VARIABLES ############################################

set(poco_Poco_ActiveRecord_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_ActiveRecord_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_ActiveRecord_BIN_DIRS_RELEASE )
set(poco_Poco_ActiveRecord_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_ActiveRecord_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_ActiveRecord_RES_DIRS_RELEASE )
set(poco_Poco_ActiveRecord_DEFINITIONS_RELEASE )
set(poco_Poco_ActiveRecord_OBJECTS_RELEASE )
set(poco_Poco_ActiveRecord_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_ActiveRecord_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_ActiveRecord_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_ActiveRecord_LIBS_RELEASE PocoActiveRecordmd)
set(poco_Poco_ActiveRecord_SYSTEM_LIBS_RELEASE )
set(poco_Poco_ActiveRecord_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_ActiveRecord_FRAMEWORKS_RELEASE )
set(poco_Poco_ActiveRecord_DEPENDENCIES_RELEASE Poco::Foundation Poco::Data)
set(poco_Poco_ActiveRecord_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_ActiveRecord_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_ActiveRecord_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_ActiveRecord_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_ActiveRecord_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_ActiveRecord_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_ActiveRecord_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_ActiveRecord_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_ActiveRecord_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_ActiveRecord_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::Util VARIABLES ############################################

set(poco_Poco_Util_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Util_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Util_BIN_DIRS_RELEASE )
set(poco_Poco_Util_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Util_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Util_RES_DIRS_RELEASE )
set(poco_Poco_Util_DEFINITIONS_RELEASE )
set(poco_Poco_Util_OBJECTS_RELEASE )
set(poco_Poco_Util_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_Util_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Util_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Util_LIBS_RELEASE PocoUtilmd)
set(poco_Poco_Util_SYSTEM_LIBS_RELEASE )
set(poco_Poco_Util_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Util_FRAMEWORKS_RELEASE )
set(poco_Poco_Util_DEPENDENCIES_RELEASE Poco::Foundation Poco::XML Poco::JSON)
set(poco_Poco_Util_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Util_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Util_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Util_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Util_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Util_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Util_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Util_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Util_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Util_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::Redis VARIABLES ############################################

set(poco_Poco_Redis_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Redis_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Redis_BIN_DIRS_RELEASE )
set(poco_Poco_Redis_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Redis_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Redis_RES_DIRS_RELEASE )
set(poco_Poco_Redis_DEFINITIONS_RELEASE )
set(poco_Poco_Redis_OBJECTS_RELEASE )
set(poco_Poco_Redis_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_Redis_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Redis_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Redis_LIBS_RELEASE PocoRedismd)
set(poco_Poco_Redis_SYSTEM_LIBS_RELEASE )
set(poco_Poco_Redis_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Redis_FRAMEWORKS_RELEASE )
set(poco_Poco_Redis_DEPENDENCIES_RELEASE Poco::Net)
set(poco_Poco_Redis_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Redis_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Redis_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Redis_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Redis_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Redis_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Redis_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Redis_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Redis_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Redis_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::MongoDB VARIABLES ############################################

set(poco_Poco_MongoDB_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_MongoDB_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_MongoDB_BIN_DIRS_RELEASE )
set(poco_Poco_MongoDB_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_MongoDB_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_MongoDB_RES_DIRS_RELEASE )
set(poco_Poco_MongoDB_DEFINITIONS_RELEASE )
set(poco_Poco_MongoDB_OBJECTS_RELEASE )
set(poco_Poco_MongoDB_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_MongoDB_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_MongoDB_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_MongoDB_LIBS_RELEASE PocoMongoDBmd)
set(poco_Poco_MongoDB_SYSTEM_LIBS_RELEASE )
set(poco_Poco_MongoDB_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_MongoDB_FRAMEWORKS_RELEASE )
set(poco_Poco_MongoDB_DEPENDENCIES_RELEASE Poco::Net)
set(poco_Poco_MongoDB_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_MongoDB_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_MongoDB_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_MongoDB_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_MongoDB_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_MongoDB_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_MongoDB_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_MongoDB_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_MongoDB_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_MongoDB_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::JWT VARIABLES ############################################

set(poco_Poco_JWT_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_JWT_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_JWT_BIN_DIRS_RELEASE )
set(poco_Poco_JWT_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_JWT_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_JWT_RES_DIRS_RELEASE )
set(poco_Poco_JWT_DEFINITIONS_RELEASE )
set(poco_Poco_JWT_OBJECTS_RELEASE )
set(poco_Poco_JWT_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_JWT_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_JWT_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_JWT_LIBS_RELEASE PocoJWTmd)
set(poco_Poco_JWT_SYSTEM_LIBS_RELEASE )
set(poco_Poco_JWT_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_JWT_FRAMEWORKS_RELEASE )
set(poco_Poco_JWT_DEPENDENCIES_RELEASE Poco::JSON Poco::Crypto)
set(poco_Poco_JWT_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_JWT_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_JWT_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_JWT_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_JWT_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_JWT_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_JWT_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_JWT_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_JWT_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_JWT_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::DataSQLite VARIABLES ############################################

set(poco_Poco_DataSQLite_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_DataSQLite_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_DataSQLite_BIN_DIRS_RELEASE )
set(poco_Poco_DataSQLite_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_DataSQLite_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_DataSQLite_RES_DIRS_RELEASE )
set(poco_Poco_DataSQLite_DEFINITIONS_RELEASE )
set(poco_Poco_DataSQLite_OBJECTS_RELEASE )
set(poco_Poco_DataSQLite_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_DataSQLite_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_DataSQLite_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_DataSQLite_LIBS_RELEASE PocoDataSQLitemd)
set(poco_Poco_DataSQLite_SYSTEM_LIBS_RELEASE )
set(poco_Poco_DataSQLite_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_DataSQLite_FRAMEWORKS_RELEASE )
set(poco_Poco_DataSQLite_DEPENDENCIES_RELEASE Poco::Data SQLite::SQLite3)
set(poco_Poco_DataSQLite_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_DataSQLite_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_DataSQLite_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_DataSQLite_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_DataSQLite_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_DataSQLite_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_DataSQLite_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_DataSQLite_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_DataSQLite_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_DataSQLite_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::DataPostgreSQL VARIABLES ############################################

set(poco_Poco_DataPostgreSQL_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_DataPostgreSQL_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_DataPostgreSQL_BIN_DIRS_RELEASE )
set(poco_Poco_DataPostgreSQL_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_DataPostgreSQL_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_DataPostgreSQL_RES_DIRS_RELEASE )
set(poco_Poco_DataPostgreSQL_DEFINITIONS_RELEASE )
set(poco_Poco_DataPostgreSQL_OBJECTS_RELEASE )
set(poco_Poco_DataPostgreSQL_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_DataPostgreSQL_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_DataPostgreSQL_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_DataPostgreSQL_LIBS_RELEASE PocoDataPostgreSQLmd)
set(poco_Poco_DataPostgreSQL_SYSTEM_LIBS_RELEASE )
set(poco_Poco_DataPostgreSQL_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_DataPostgreSQL_FRAMEWORKS_RELEASE )
set(poco_Poco_DataPostgreSQL_DEPENDENCIES_RELEASE Poco::Data PostgreSQL::PostgreSQL)
set(poco_Poco_DataPostgreSQL_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_DataPostgreSQL_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_DataPostgreSQL_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_DataPostgreSQL_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_DataPostgreSQL_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_DataPostgreSQL_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_DataPostgreSQL_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_DataPostgreSQL_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_DataPostgreSQL_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_DataPostgreSQL_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::DataMySQL VARIABLES ############################################

set(poco_Poco_DataMySQL_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_DataMySQL_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_DataMySQL_BIN_DIRS_RELEASE )
set(poco_Poco_DataMySQL_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_DataMySQL_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_DataMySQL_RES_DIRS_RELEASE )
set(poco_Poco_DataMySQL_DEFINITIONS_RELEASE )
set(poco_Poco_DataMySQL_OBJECTS_RELEASE )
set(poco_Poco_DataMySQL_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_DataMySQL_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_DataMySQL_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_DataMySQL_LIBS_RELEASE PocoDataMySQLmd)
set(poco_Poco_DataMySQL_SYSTEM_LIBS_RELEASE )
set(poco_Poco_DataMySQL_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_DataMySQL_FRAMEWORKS_RELEASE )
set(poco_Poco_DataMySQL_DEPENDENCIES_RELEASE Poco::Data libmysqlclient::libmysqlclient)
set(poco_Poco_DataMySQL_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_DataMySQL_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_DataMySQL_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_DataMySQL_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_DataMySQL_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_DataMySQL_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_DataMySQL_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_DataMySQL_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_DataMySQL_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_DataMySQL_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::XML VARIABLES ############################################

set(poco_Poco_XML_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_XML_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_XML_BIN_DIRS_RELEASE )
set(poco_Poco_XML_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_XML_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_XML_RES_DIRS_RELEASE )
set(poco_Poco_XML_DEFINITIONS_RELEASE )
set(poco_Poco_XML_OBJECTS_RELEASE )
set(poco_Poco_XML_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_XML_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_XML_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_XML_LIBS_RELEASE PocoXMLmd)
set(poco_Poco_XML_SYSTEM_LIBS_RELEASE )
set(poco_Poco_XML_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_XML_FRAMEWORKS_RELEASE )
set(poco_Poco_XML_DEPENDENCIES_RELEASE Poco::Foundation expat::expat)
set(poco_Poco_XML_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_XML_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_XML_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_XML_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_XML_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_XML_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_XML_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_XML_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_XML_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_XML_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::Net VARIABLES ############################################

set(poco_Poco_Net_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Net_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Net_BIN_DIRS_RELEASE )
set(poco_Poco_Net_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Net_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Net_RES_DIRS_RELEASE )
set(poco_Poco_Net_DEFINITIONS_RELEASE )
set(poco_Poco_Net_OBJECTS_RELEASE )
set(poco_Poco_Net_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_Net_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Net_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Net_LIBS_RELEASE PocoNetmd)
set(poco_Poco_Net_SYSTEM_LIBS_RELEASE )
set(poco_Poco_Net_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Net_FRAMEWORKS_RELEASE )
set(poco_Poco_Net_DEPENDENCIES_RELEASE Poco::Foundation)
set(poco_Poco_Net_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Net_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Net_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Net_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Net_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Net_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Net_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Net_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Net_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Net_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::JSON VARIABLES ############################################

set(poco_Poco_JSON_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_JSON_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_JSON_BIN_DIRS_RELEASE )
set(poco_Poco_JSON_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_JSON_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_JSON_RES_DIRS_RELEASE )
set(poco_Poco_JSON_DEFINITIONS_RELEASE )
set(poco_Poco_JSON_OBJECTS_RELEASE )
set(poco_Poco_JSON_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_JSON_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_JSON_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_JSON_LIBS_RELEASE PocoJSONmd)
set(poco_Poco_JSON_SYSTEM_LIBS_RELEASE )
set(poco_Poco_JSON_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_JSON_FRAMEWORKS_RELEASE )
set(poco_Poco_JSON_DEPENDENCIES_RELEASE Poco::Foundation)
set(poco_Poco_JSON_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_JSON_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_JSON_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_JSON_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_JSON_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_JSON_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_JSON_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_JSON_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_JSON_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_JSON_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::Encodings VARIABLES ############################################

set(poco_Poco_Encodings_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Encodings_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Encodings_BIN_DIRS_RELEASE )
set(poco_Poco_Encodings_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Encodings_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Encodings_RES_DIRS_RELEASE )
set(poco_Poco_Encodings_DEFINITIONS_RELEASE )
set(poco_Poco_Encodings_OBJECTS_RELEASE )
set(poco_Poco_Encodings_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_Encodings_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Encodings_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Encodings_LIBS_RELEASE PocoEncodingsmd)
set(poco_Poco_Encodings_SYSTEM_LIBS_RELEASE )
set(poco_Poco_Encodings_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Encodings_FRAMEWORKS_RELEASE )
set(poco_Poco_Encodings_DEPENDENCIES_RELEASE Poco::Foundation)
set(poco_Poco_Encodings_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Encodings_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Encodings_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Encodings_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Encodings_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Encodings_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Encodings_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Encodings_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Encodings_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Encodings_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::Data VARIABLES ############################################

set(poco_Poco_Data_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Data_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Data_BIN_DIRS_RELEASE )
set(poco_Poco_Data_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Data_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Data_RES_DIRS_RELEASE )
set(poco_Poco_Data_DEFINITIONS_RELEASE )
set(poco_Poco_Data_OBJECTS_RELEASE )
set(poco_Poco_Data_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_Data_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Data_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Data_LIBS_RELEASE PocoDatamd)
set(poco_Poco_Data_SYSTEM_LIBS_RELEASE )
set(poco_Poco_Data_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Data_FRAMEWORKS_RELEASE )
set(poco_Poco_Data_DEPENDENCIES_RELEASE Poco::Foundation)
set(poco_Poco_Data_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Data_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Data_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Data_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Data_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Data_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Data_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Data_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Data_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Data_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::Crypto VARIABLES ############################################

set(poco_Poco_Crypto_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Crypto_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Crypto_BIN_DIRS_RELEASE )
set(poco_Poco_Crypto_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Crypto_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Crypto_RES_DIRS_RELEASE )
set(poco_Poco_Crypto_DEFINITIONS_RELEASE )
set(poco_Poco_Crypto_OBJECTS_RELEASE )
set(poco_Poco_Crypto_COMPILE_DEFINITIONS_RELEASE )
set(poco_Poco_Crypto_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Crypto_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Crypto_LIBS_RELEASE PocoCryptomd)
set(poco_Poco_Crypto_SYSTEM_LIBS_RELEASE )
set(poco_Poco_Crypto_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Crypto_FRAMEWORKS_RELEASE )
set(poco_Poco_Crypto_DEPENDENCIES_RELEASE Poco::Foundation openssl::openssl)
set(poco_Poco_Crypto_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Crypto_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Crypto_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Crypto_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Crypto_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Crypto_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Crypto_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Crypto_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Crypto_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Crypto_COMPILE_OPTIONS_C_RELEASE}>")
########### COMPONENT Poco::Foundation VARIABLES ############################################

set(poco_Poco_Foundation_INCLUDE_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/include")
set(poco_Poco_Foundation_LIB_DIRS_RELEASE "${poco_PACKAGE_FOLDER_RELEASE}/lib")
set(poco_Poco_Foundation_BIN_DIRS_RELEASE )
set(poco_Poco_Foundation_LIBRARY_TYPE_RELEASE STATIC)
set(poco_Poco_Foundation_IS_HOST_WINDOWS_RELEASE 1)
set(poco_Poco_Foundation_RES_DIRS_RELEASE )
set(poco_Poco_Foundation_DEFINITIONS_RELEASE "-DPOCO_NO_AUTOMATIC_LIBS"
			"-DPOCO_STATIC=ON"
			"-DPOCO_UNBUNDLED")
set(poco_Poco_Foundation_OBJECTS_RELEASE )
set(poco_Poco_Foundation_COMPILE_DEFINITIONS_RELEASE "POCO_NO_AUTOMATIC_LIBS"
			"POCO_STATIC=ON"
			"POCO_UNBUNDLED")
set(poco_Poco_Foundation_COMPILE_OPTIONS_C_RELEASE "")
set(poco_Poco_Foundation_COMPILE_OPTIONS_CXX_RELEASE "")
set(poco_Poco_Foundation_LIBS_RELEASE PocoFoundationmd)
set(poco_Poco_Foundation_SYSTEM_LIBS_RELEASE ws2_32 iphlpapi crypt32)
set(poco_Poco_Foundation_FRAMEWORK_DIRS_RELEASE )
set(poco_Poco_Foundation_FRAMEWORKS_RELEASE )
set(poco_Poco_Foundation_DEPENDENCIES_RELEASE pcre2::pcre2 ZLIB::ZLIB)
set(poco_Poco_Foundation_SHARED_LINK_FLAGS_RELEASE )
set(poco_Poco_Foundation_EXE_LINK_FLAGS_RELEASE )
set(poco_Poco_Foundation_NO_SONAME_MODE_RELEASE FALSE)

# COMPOUND VARIABLES
set(poco_Poco_Foundation_LINKER_FLAGS_RELEASE
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${poco_Poco_Foundation_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${poco_Poco_Foundation_SHARED_LINK_FLAGS_RELEASE}>
        $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${poco_Poco_Foundation_EXE_LINK_FLAGS_RELEASE}>
)
set(poco_Poco_Foundation_COMPILE_OPTIONS_RELEASE
    "$<$<COMPILE_LANGUAGE:CXX>:${poco_Poco_Foundation_COMPILE_OPTIONS_CXX_RELEASE}>"
    "$<$<COMPILE_LANGUAGE:C>:${poco_Poco_Foundation_COMPILE_OPTIONS_C_RELEASE}>")