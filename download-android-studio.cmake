set(ANDROID_STUDIO_LOCATION $ENV{USERPROFILE}/Downloads/android-studio-2022.1.1.21-windows.zip)

file(DOWNLOAD 
    "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.1.1.21/android-studio-2022.1.1.21-windows.zip" 
    ${ANDROID_STUDIO_LOCATION}
    INACTIVITY_TIMEOUT 5
    STATUS ANDROID_STUDIO_STATUS_TUPLE)

list(GET ANDROID_STUDIO_STATUS_TUPLE 0 ANDROID_STUDIO_STATUS)

if (ANDROID_STUDIO_STATUS EQUAL 0)
    message("SUCCESS")
else()
    message("NOT SUCCESS")
endif()