import SwiftUI
import MessageUI

struct InfoView: View {
    let currentScore: Int
    let highScore: Int
    @Environment(\.dismiss) private var dismiss
    @State private var showingMailCompose = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Header
                VStack(spacing: 10) {
                    Image(systemName: "bubble.middle.bottom.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue.opacity(0.7))
                    
                    Text("Bubble Popper")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Version 1.0")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Scores Section
                VStack(spacing: 15) {
                    Text("Scores")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    HStack(spacing: 40) {
                        VStack {
                            Text("\(currentScore)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("Current")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        VStack {
                            Text("\(highScore)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.orange)
                            Text("High Score")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.ultraThinMaterial)
                    )
                }
                
                // Maker Information
                VStack(spacing: 15) {
                    Text("About")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("A simple and fun bubble popping game designed for toddlers and kids.")
                            .multilineTextAlignment(.center)
                        
                        Text("Created with love for endless entertainment!")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.ultraThinMaterial)
                    )
                }
                
                // Contact Section
                VStack(spacing: 15) {
                    Text("Contact")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Button(action: {
                        if MFMailComposeViewController.canSendMail() {
                            showingMailCompose = true
                        } else {
                            // Fallback to opening mail app with mailto
                            if let url = URL(string: "mailto:feedback@bubblepopper.app?subject=Bubble%20Popper%20Feedback") {
                                UIApplication.shared.open(url)
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "envelope.fill")
                            Text("Send Feedback or Report Bugs")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.blue)
                        )
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Info")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .sheet(isPresented: $showingMailCompose) {
            MailComposeView(
                subject: "Bubble Popper Feedback",
                recipients: ["feedback@bubblepopper.app"],
                messageBody: "Hi! I'd like to share some feedback about Bubble Popper:\n\n"
            )
        }
    }
}

struct MailComposeView: UIViewControllerRepresentable {
    let subject: String
    let recipients: [String]
    let messageBody: String
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = context.coordinator
        composer.setSubject(subject)
        composer.setToRecipients(recipients)
        composer.setMessageBody(messageBody, isHTML: false)
        return composer
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailComposeView
        
        init(_ parent: MailComposeView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            parent.dismiss()
        }
    }
}

#Preview {
    InfoView(currentScore: 42, highScore: 156)
}