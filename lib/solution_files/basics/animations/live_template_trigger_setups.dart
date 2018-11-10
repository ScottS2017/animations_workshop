// Use this setup to have an animation play forward and reverse when triggered only once.
/*

  Future _startAnimation() async {
    try {
      await _controller
        .forward()
        .orCancel;
      await _controller
        .reverse()
        .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  // Use with this GestureDetector

  GestureDetector(
            onTap: () {
                _startAnimation();
            },
            child:

  */

// ***********************************************************************


// Use this setup to tap once to go forward and then tap again to go back:
// Put the bool at the top of the state, outside the build()
/*


bool animationDirectionIsForward = true;

Future<Null> _startAnimation(bool forward) async {
  try {
    if(forward) {
      await _controller
        .forward()
        .orCancel;
    } else if (!forward) {
      await _controller
        .reverse()
        .orCancel;
    }
  } on TickerCanceled {
    // the animation got canceled, probably because we were disposed
  }
}


// Use with this GestureDetector:

GestureDetector(
      onTap: () {
        _playAnimation(animationDirectionIsForward);
        animationDirectionIsForward = !animationDirectionIsForward;
      },
      child:
     ),

*/

// ***********************************************************************

// Use this setup if you want to trigger the animation forward and then have it reset, without playing in reverse
/*

Future _startAnimation() async {
        try {
            await _controller
                .forward()
                .orCancel;
        } on TickerCanceled {
            print('Animation Failed');
        }
        _controller.reset();
    }

    // Use with this Gesture Detector

    GestureDetector(
            onTap: () {
                _startAnimation();
            },
            child:
            ),
  */

// ***********************************************************************
