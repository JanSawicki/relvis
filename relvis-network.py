import networkx as nx
import matplotlib.pyplot as plt


# CSV columns:
# sentence_num, active_actor, aim, aim_category, deontic, active_condition, method, passive_actor, object


# Graph initialization
G = nx.DiGraph()

# Relation adding example
# G.add_edge("person 1", "person 2", relation="relation 1")

# Image definition
FILE_NAME = "RelationGraph"
GRAPH_IMAGE_SIZE = (40, 40)
fig = plt.figure(figsize=GRAPH_IMAGE_SIZE)

# Drawing the graph
edge_labels = nx.get_edge_attributes(G, 'relation')
pos = nx.planar_layout(G)

nx.draw_networkx_edge_labels(G, pos, edge_labels)
nx.draw_networkx_nodes(G, pos)
nx.draw_networkx_labels(G, pos)
plt.savefig(FILE_NAME + ".svg", format="SVG")
plt.savefig(FILE_NAME + ".png", format="PNG")

plt.show()
