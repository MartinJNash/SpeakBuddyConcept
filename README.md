Concept App for SpeakBuddy to test out some SwiftUI animations and cool UI techniques.

# Growing bars animation

I tried using Swift Charts framework to get the bar animation working. The bars animated fine, but the annotations below were not included in the layout calculations. That would require implementers to manually update layout calculations--adding offsets or extra padding--every time the text changed.

That isn't a scalable or long-term solution, so I made a custom bar graph view that leverages GeometryReader and lays out its content view at a percent of its height. That content view is supplied by the user via @ViewBuilder.

# Testing

Custom views live in their own file and have `#Preview` macros to get immediate feedback when updating UI.

#  iPhone / iPad screen size considerations

The graph section grows to fill available space on larger screens. It still fits comfortably on the iPhone SE.

# Screenshots

![SpeakBuddyConceptScreenshots 002](https://github.com/MartinJNash/SpeakBuddyConcept/assets/1054936/ff084554-5128-434f-8eda-e3d08f037af2)
![SpeakBuddyConceptScreenshots 001](https://github.com/MartinJNash/SpeakBuddyConcept/assets/1054936/db362102-797b-441d-ad52-33d4468da0db)
