import ArgumentParser

@main
public struct Advent22: ParsableCommand {
    
    static public var configuration = CommandConfiguration(subcommands: [Day1.self])
    
    public init() {
        
    }

    public func run() throws {
        print("run")
    }

}
