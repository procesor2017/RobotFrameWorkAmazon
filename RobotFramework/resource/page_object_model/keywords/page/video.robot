***Settings***
Documentation           Page for Video 

***Keywords***
Find TV Channel
    [Arguments]                                         ${content_which_must_have}=${USER_TV_CHANNEL}    ${id_elements}=${SEARCH_RESULT_ANDROID_VIEW}
    # Swipe down Find Element by contentDescription       ${id_elements}                                   ${content_which_must_have}
    Swipe Down and Find Element                               ${VIDEO_POPULAR_MOVIES}