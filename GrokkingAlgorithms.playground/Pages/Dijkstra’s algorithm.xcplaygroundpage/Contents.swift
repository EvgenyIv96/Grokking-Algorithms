//: [Previous](@previous)

import Foundation

typealias Graph = [String: [String: Int]]

// Graph
var graph = Graph()

graph["start"] = [String: Int]()
graph["start"]!["a"] = 6
graph["start"]!["b"] = 2

graph["a"] = [String: Int]()
graph["a"]!["fin"] = 1

graph["b"] = [String: Int]()
graph["b"]!["a"] = 3
graph["b"]!["fin"] = 5

graph["fin"] = [String: Int]()

var initialCosts = [String: Int]()
initialCosts["a"] = 6
initialCosts["b"] = 2
initialCosts["fin"] = Int.max

var initialParents = [String: String]()
initialParents["a"] = "start"
initialParents["b"] = "start"

/// Function is used to find a lowest cost to the node in the given graph using Dijkstra's algorith. If given graph is direct & acyclic without negative edges and route for given node exists function returns lowest cost value and cheapest route in format «node -> node -> ...» otherwise function returns nil.
///
/// - Parameters:
///   - graph: Graph. Should be DAG (Direct acyclic graph) without negative edges.
///   - node: Node for which function looking cheapest route for.
///   - initialCostsTable: Initial costs table with known costs from start node to neighbors and infinity costs to another nodes.
///   - initialParentsTable: Initial parents table.
/// - Returns: Lowest cost and cheapest route string in format «node -> node -> ...»
func findLowestCost(in graph: Graph, to node: String, initialCostsTable: [String: Int], initialParentsTable: [String: String]) -> (lowestCost: Int, cheapestRoute: String)? {
    
    // Min costs table
    var costs = initialCostsTable
    
    // Parents table
    var parents = [String: String]()
    
    // Processed nodes array
    var processed = [String]()

    /// Function is used to obtain unprocessed lowest cost node. Function may return nil if there isn't unprocessed node.
    ///
    /// - Parameters:
    ///   - costs: Costs dictionary.
    ///   - processedNodes: Array of processed nodes.
    /// - Returns: Unprocessed lowest cost node if it exists.
    func findLowestCostNode(in costs: [String: Int], processedNodes: [String]) -> String? {
        
        var minCostNode: (nodeName: String, cost: Int)? = nil
        
        costs.keys.map { node in
            if processed.index(of: node) == nil {
                guard let nodeCost = costs[node] else { return }
                if let previousMinCostNode = minCostNode, nodeCost < previousMinCostNode.cost {
                    minCostNode = (node, nodeCost)
                } else if minCostNode == nil {
                    minCostNode = (node, nodeCost)
                }
            }
        }
        
        return minCostNode?.nodeName ?? nil
        
    }

    /// Function is used to calculate lowest costs from  in given graph.
    ///
    /// - Parameter graph: Graph.
    func calculateCostsAndSetParents(in graph: Graph, costsTable: inout [String: Int], parentsTable: inout [String: String]) {
        
        var minCostNode = findLowestCostNode(in: costs, processedNodes: processed)
        
        while minCostNode != nil {
            
            if let currentProcessedNode = minCostNode, let neighborsAndCosts = graph[currentProcessedNode], let cost = costs[currentProcessedNode] {
                
                neighborsAndCosts.keys.map { neighborName in
                    
                    if let costToNeighbor = neighborsAndCosts[neighborName], let currentCost = costs[neighborName], costToNeighbor < currentCost {
                        
                        costs[neighborName] = cost + costToNeighbor
                        parents[neighborName] = currentProcessedNode
                        
                    }
                    
                }
                
                processed.append(currentProcessedNode)
                
            }
            
            minCostNode = findLowestCostNode(in: costs, processedNodes: processed)
            
        }
        
    }
    
    func obtainRoute(to node: String, in parentsTable: [String: String]) -> String {
        
        let parentPointerFormat = " -> "
        var routeString = ""
        
        var parent = parentsTable[node]
        
        if let _ = parent {
            routeString = parentPointerFormat + node
        }
        
        while parent != nil {
            routeString = parent! + routeString
            parent = parentsTable[parent!]
            if parent != nil {
                routeString = parentPointerFormat + routeString
            }
        }

        return routeString
        
    }
    
    calculateCostsAndSetParents(in: graph, costsTable: &costs, parentsTable: &parents)
    
    guard let cost = costs[node] else { return nil }
    
    let routeString = obtainRoute(to: node, in: parents)
    
    return (cost, routeString)
    
}

print(graph)

let result = findLowestCost(in: graph, to: "fin", initialCostsTable: initialCosts, initialParentsTable: initialParents)

result?.lowestCost
result?.cheapestRoute
//: [Next](@next)
