#!/bin/bash

sed -i '/import com.n8id.elm.core.orchestration.flow.ProcessDatumDefinition;/a \import com.n8id.elm.core.orchestration.flow.WaitDatumDefinition;' $1

sed -i '/private static final Set<ProcessDatumDefinition> processDataDefinition = new HashSet<ProcessDatumDefinition>();/a \    private static final Set<WaitDatumDefinition> waitDataDefinition = new HashSet<WaitDatumDefinition>();' $1

sed -i '
/public Set<ProcessDatumDefinition> defineProcessDataDefinition()/ {
    N
    N
    a\
\n    @Override\n    public Set<WaitDatumDefinition> defineWaitDataDefinition() {\n        return waitDataDefinition;\n    }
}' $1
