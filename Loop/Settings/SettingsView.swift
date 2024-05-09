//
//  SettingsView.swift
//  Loop
//
//  Created by Kai Azim on 2023-11-30.
//

import SwiftUI
import Sparkle

struct SettingsView: View {
  @State var selectedTab = 0
  @StateObject private var updater = SoftwareUpdater()
  private var appListManager = AppListManager()
  
  var body: some View {
    TabView(selection: $selectedTab) {
      GeneralSettingsView()
        .tabItem {
          Label("General", systemImage: "gearshape")
        }
        .tag(0)
        .frame(width: 450)
      
      RadialMenuSettingsView()
        .tabItem {
          Label("Radial Menu", image: "loop")
        }
        .tag(1)
        .frame(width: 450)
      
      PreviewSettingsView()
        .tabItem {
          Label("Preview", systemImage: "rectangle.dashed")
        }
        .tag(2)
        .frame(width: 450)
      
      KeybindingsSettingsView()
        .tabItem {
          Label("Key Bindings", systemImage: "keyboard")
        }
        .tag(3)
        .frame(width: 450)
        .frame(minHeight: 500, maxHeight: 680)
      
      ExcludeListSettingsView()
        .tabItem {
          Label("Excluded Apps", systemImage: "xmark.app")
        }
        .tag(4)
        .environmentObject(appListManager)
        .frame(width: 450)
        .frame(maxHeight: 680)
      
      MoreSettingsView()
        .tabItem {
          Text("More")
          Label("More", systemImage: "ellipsis.circle")
        }
        .tag(5)
        .environmentObject(updater)
        .frame(width: 450)
    }
    .fixedSize(horizontal: true, vertical: true)
  }
}
