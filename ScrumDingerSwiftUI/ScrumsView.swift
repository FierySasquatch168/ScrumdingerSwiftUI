//
//  ScrumsView.swift
//  ScrumDingerSwiftUI
//
//  Created by Aleksandr Eliseev on 14.01.2023.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment (\.scenePhase) private var scenePhase
    @State var isPresentingNewScrumView = false
    @State var newScrumData = DailyScrum.Data()
    let saveAction: () -> Void
    
    
    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .onDelete { indexSet in
                scrums.remove(atOffsets: indexSet)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {
                isPresentingNewScrumView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveAction()
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
        }
    }
}
