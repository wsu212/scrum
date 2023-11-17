//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by 蘇偉綸 on 2023/11/15.
//

import SwiftUI

struct DetailEditView: View {
    // @State property wrapper defines the source of truth for value types.
    @State private var scrum = DailyScrum.emptyScrum
    
    // The newAttendeeName property holds the attendee name that the user enters.
    @State private var newAttendeeName: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                // Use the $ syntax to create a binding to scrum.title
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        // The Text view won’t appear onscreen, but VoiceOver uses it to identify the purpose of the slider.
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            // Setting the value to the empty string also clears the contents of the text field.
                            newAttendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
