function [new_rf, result] = update_stSaliency(feature, mask, old_rf)

N_TREE = 1;
N_ADDTREE = 1;
MAX_TREE = 20;

[rf, ~] = init_pgrf(feature, mask, N_TREE,old_rf.mainTree{1,1});
% [rf, ~] = update_pgrf(feature, mask, old_rf, N_TREE);

new_rf.mainTree = cat(1, rf.mainTree(1:N_ADDTREE,1), old_rf.mainTree);
aa = max(max(rf.leaf2partialTree(:, 1:N_ADDTREE)));
new_rf.leaf2partialTree = ...
    cat(2, rf.leaf2partialTree(:, 1:N_ADDTREE), old_rf.leaf2partialTree+aa*(old_rf.leaf2partialTree>0));
if(aa > 0)
    new_rf.partialTree = cat(1, rf.partialTree(1:aa,1), old_rf.partialTree);
    new_rf.subProb = cat(1, rf.subProb(1:aa,1), old_rf.subProb);
else
    new_rf.partialTree = old_rf.partialTree;
    new_rf.subProb = old_rf.subProb;
end
new_rf.mainProb = cat(2, rf.mainProb(:,1:N_ADDTREE), old_rf.mainProb);


if(size(new_rf.mainTree, 1) > MAX_TREE)
    new_rf.mainTree = new_rf.mainTree(1:MAX_TREE, 1);
    new_rf.leaf2partialTree = new_rf.leaf2partialTree(:,1:MAX_TREE);
    if(max(vec(new_rf.leaf2partialTree)) > 0)
        new_rf.partialTree = new_rf.partialTree(1:max(vec(new_rf.leaf2partialTree)), 1); 
        new_rf.subProb = new_rf.subProb(1:size(new_rf.partialTree,1), 1);
    end
    new_rf.mainProb = new_rf.mainProb(:,1:MAX_TREE);    
end

result = eval_pgrf(feature, new_rf);
