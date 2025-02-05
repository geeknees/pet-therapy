import DesignSystem
import Schwifty
import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: .xl) {
            LeaveReview()
            DonationsView()
            Spacer()            
            Socials()
            PrivacyPolicy()
            AppVersion()
        }
        .multilineTextAlignment(.center)
        .padding(.md)
    }
}

private struct AppVersion: View {
    @EnvironmentObject var appState: AppState
        
    var text: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let dev = appState.isDevApp ? "Dev" : ""
        return ["v.", version ?? "n/a", dev]
            .filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    var body: some View {
        Text(text)
    }
}

private struct PrivacyPolicy: View {
    var body: some View {
        Button(Lang.About.privacyPolicy) {
            URL.visit(urlString: Lang.Urls.privacy)
        }
        .buttonStyle(.text)
    }
}

private struct Socials: View {
    var body: some View {
        HStack(spacing: .xl) {
            SocialIcon(name: "github", link: Lang.Urls.github)
            SocialIcon(name: "twitter", link: Lang.Urls.twitter)
            SocialIcon(name: "reddit", link: Lang.Urls.reddit)
            SocialIcon(name: "discord", link: Lang.Urls.discord)
        }
    }
}

private struct SocialIcon: View {
    let name: String
    let link: String
    
    var body: some View {
        Image(name)
            .resizable()
            .antialiased(true)
            .frame(width: 32, height: 32)
            .onTapGesture { URL.visit(urlString: link) }
    }
}

private struct LeaveReview: View {
    var body: some View {
        VStack(spacing: .md) {
            Text(Lang.About.leaveReviewMessage)
            Button(Lang.About.leaveReview) {
                URL.visit(urlString: Lang.Urls.appStore)
            }
            .buttonStyle(.regular)
        }
    }
}

private struct DonationsView: View {
    var body: some View {
        VStack(spacing: .md) {
            Text(Lang.Donations.title).font(.title3.bold())
            Text(Lang.Donations.message)
            Button(Lang.Donations.linkTitle) {
                URL.visit(urlString: Lang.Urls.donations)
            }
            .buttonStyle(.regular)
        }
    }
}
