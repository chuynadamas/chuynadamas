import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Lazzaro: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://cerovaroproductions.com")!
    var name = "Cero Varo Productions"
    var description = "This is the lazaro project, the man who return from dead"
    var language: Language { .english }
    var imagePath: Path? { nil }
    
}

// This will generate your website using the built-in Foundation theme:
try Lazzaro().publish(withTheme: .foundation)


extension Theme where Site == Lazzaro {
  static var basic: Self {
    Theme(htmlFactory: BasicHTMLFactory())
  }
}

struct BasicHTMLFactory: HTMLFactory {
  func makeIndexHTML(for index: Index, context: PublishingContext<Lazzaro>) throws -> HTML {
    HTML(
      .lang(context.site.language),
      .head(for: index, on: context.site),
      .body(
        // Header
        .h1(.text(context.site.name)),
        .h2(.text(context.site.description)),
        // Navigation
        .nav(.ul(
          .forEach(Site.SectionID.allCases) { section in
            .li(.a(
              .href(context.sections[section].path),
              .text(context.sections[section].title)
            ))
          }
        )),
        // Items
        .ul(.forEach(context.allItems(sortedBy: \.date, order: .descending)) { item in
          .li(
            .a(
              .href(item.path),
              .text(item.title)
            ),
            .p(.text(item.description))
          )
        })
      )
    )
  }
  
  func makeSectionHTML(for section: Section<Lazzaro>, context: PublishingContext<Lazzaro>) throws -> HTML {
    HTML()
  }
  
  func makeItemHTML(for item: Item<Lazzaro>, context: PublishingContext<Lazzaro>) throws -> HTML {
    HTML()
  }
  
  func makePageHTML(for page: Page, context: PublishingContext<Lazzaro>) throws -> HTML {
    HTML()
  }
  
  func makeTagListHTML(for page: TagListPage, context: PublishingContext<Lazzaro>) throws -> HTML? {
    nil
  }
  
  func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Lazzaro>) throws -> HTML? {
    nil
  }
}
