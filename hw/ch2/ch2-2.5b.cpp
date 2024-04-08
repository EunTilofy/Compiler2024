#include <bits/stdc++.h>
using namespace std;
int G[1<<6][2];

bool vis[1<<6];

int mska(int i) {
    switch (i)
    {
    case 1:
        return 3;
        break;
    case 6:
        return 0;
        break;
    default:
        return (1<<i);
        break;
    }
}
int mskb(int i) {
    switch (i)
    {
    case 1: return 1;
        break;
    case 6:
        return 0;
        break;
    default:
        return (1<<i);
        break;
    }
}

void dfs(int x) {
    if(vis[x]) return ;
    vis[x] = 1;
    dfs(G[x][0]);
    dfs(G[x][1]);
}

string Tostring(int x) {
    return to_string(x);
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    for(int i = 1; i < (1<<6); ++i) {
        int _a = 0, _b = 0;
        for(int j = 1; j <= 6; ++j) {
            if(i >> (j-1) & 1) {
                _a |= mska(j);
                _b |= mskb(j);
            }
        }
        G[i][0] = _a; G[i][1] = _b;
    }

    dfs(1);
    cout << "states = {";
    for(int i = 1; i < (1<<6); ++i) if(vis[i]) {
        cout << "\'" << Tostring(i) << "\',";
    }
    cout << "}\n";
    cout << "transitions = {\n";
    for(int i = 1; i < (1<<6); ++i) if(vis[i]) {
        cout << "\'" << Tostring(i) << "\':{";
        cout << "\'a\': \'" << Tostring(G[i][0]) << "\', \'b\': \'" << Tostring(G[i][1]) << '\'';
        cout << "},\n";
    }
    cout << "}\naccept_states = {";
    for(int i = 1; i < (1<<6); ++i) if(vis[i] && (i>>5&1)) {
        cout << "\'" << Tostring(i) << "\',";
    }
    cout << "}\nstart_state = '1'";
}